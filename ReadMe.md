# How to figure out **why** your dataset has duplicates using SQL.

You'll find many guides online explaining how to determine if your table has duplicates, and how to remove those duplicates when you find them. But perhaps you have a dataset that was created from multiple sources, and you want to determine which source is duplicating the results. Maybe you have a dataset where you're only expecting one result per day, and you received two different records for the same day, and you want to see if the "duplicates" are truly duplicates. This guide will show you a query that you can use to possibly determine why those duplicates exist in the first place. We will do this using window functions.

## What is a window function?
A window function is a function in SQL that uses values over multiple rows to return a value for each row. It's named as such because it's as if you have a *window* into a different query for each row in your query. It's still hard to understand what they are from that description, so instead let's take a look at an example where a window function is useful.

I will be using SQL server syntax, but the syntax should be the same or have some minor differences no matter which SQL you're using. Let's look at this table. You can follow along using Sql fiddle [here](https://sqlfiddle.com/sql-server/online-compiler?id=7dcbcf74-978d-4849-9f61-cda5a2244350).

```SQL
create table user_totals
(
    id          INT,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    state       VARCHAR(50),
    total_spent DECIMAL(10, 2)
);
```

Suppose we want to get a list of all users and include a column that is the percentage of the total amount that person spent in their state. We will need the total amount spent in a state which can be achieved by using a `group by` query.

```SQL
select state,
       sum(total_spent) as total_spent
from user_totals
group by state
```

| state      | total_spent |
|------------|-------------|
| California | 440.57      |
| Colorado   | 243.56      |
| Florida    | 300.17      |
| New York   | 178.37      |
| Texas      | 318.18      |

However, our final query will need one record for every user in our table, so let's see how we can get this total through a window function. First we will do a normal select on the table, but include a window function in the select list that will contain the total amount for a state.

```SQL
select id,
       first_name,
       last_name,
       state,
       total_spent,
       sum(total_spent) over (partition by state) as state_total_spent
from user_totals
order by id
```
| id | first_name | last_name | state      | total_spent | state_total_spent |
|----|------------|-----------|------------|-------------|-------------------|
| 1  | Blayne     | Hubner    | Florida    | 99.66       | 300.17            |
| 2  | Ricardo    | Striker   | New York   | 79.07       | 178.37            |
| 3  | Melodee    | Veronique | California | 50.12       | 440.57            |
| 4  | Lory       | Kerins    | California | 13.42       | 440.57            |
| -- | ---        | ---       | ---        | ---         | ---               |
| 30 | Flinn      | Gotcliff  | Texas      | 16.96       | 318.18            |

Let's break this down. First notice that the number of rows returned in this query is 30, which is the same as if you were using a normal select on the table without filtering any results. Now compare the values in the state_total_spent column to the group by results above. The values are the same! It's as if we did a join on the `group by` results above. The syntax is very similar to a group by. We just partition by the fields that we would normally `group by` and inline it in the select statement after the `over` keyword.

Now it's easy to calculate the column needed for the final result.

```SQL
select id,
       first_name,
       last_name,
       state,
       total_spent,
       total_spent / sum(total_spent) over (partition by state) 
        as percent_of_state_total
from user_totals
order by id
```

| id | first_name | last_name | state      | total_spent | percent_of_state_total |
|----|------------|-----------|------------|-------------|------------------------|
| 1  | Blayne     | Hubner    | Florida    | 99.66       | .332                   |
| 2  | Ricardo    | Striker   | New York   | 79.07       | .4433                  |
| 3  | Melodee    | Veronique | California | 50.12       | .1138                  |
| 4  | Lory       | Kerins    | California | 13.42       | .0305                  |
| -- | ---        | ---       | ---        | ---         | ---                    |
| 30 | Flinn      | Gotcliff  | Texas      | 16.96       | .0533                  |


Window functions are powerful and can be more complicated than this, but this is all we'll need for our duplicate query, so let's get to it.

## The problem space

Suppose we are given the following table. (There are some spoilers in the [sqlfiddle](https://sqlfiddle.com/sql-server/online-compiler?id=8d3992e4-b1ca-4d3b-be8f-a0fe3b5fc18f), but you can still use it to follow along.)

```SQL
create table daily_user_spend
(
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email       VARCHAR(100),
    the_date    DATE,
    total_spend DECIMAL(10, 2)
)
```
You know this table was created by combining and aggregating several datasets, but you do not have access to the source data. Your assumption is that there should be one record per person per day in the table, so let's write a query to see if there are any duplicates.

```SQL
select email,
       the_date,
       count(*) as dup_count
from daily_user_spend
group by email, the_date
having count(*) > 1
```
| email                 | the_date   | dup_count |
|-----------------------|------------|-----------|
| rswalowe2@dmoz.org    | 2024-12-01 | 2         |
| cwaistell0@cpanel.net | 2024-12-02 | 2         |
| jminer4@qq.com        | 2024-12-02 | 2         |
| --                    | --         | --        |
| jminer4@qq.com        | 2024-12-06 | 2         |

We have 7 duplicates in the dataset. We could just contact the dataset owner at this point and tell them we've found duplicates, but maybe we can discover why those duplicates might exist. The above query does us no good, because we can't see the actual rows that have been duplicated. Let's use a window function to see if looking at the rows gives us any additional insight.

```sql
select 
    first_name,
    last_name,
    email,
    the_date,
    total_spend,
    count(*) over (partition by email, the_date) as dup_count
from daily_user_spend
```

| first_name | last_name   | email                          | the_date   | total_spend | dup_count |
|------------|-------------|--------------------------------|------------|-------------|-----------|
| Carr       | Scarborough | cscarborough3@odnoklassniki.ru | 2024-12-02 | 8.14        | 1         |
| Celeste    | Waistell    | cwaistell0@cpanel.net          | 2024-12-02 | 11.27       | 2         |
| --         | --          | --                             | --         | --          | --        |
| Reece      | Swalowe     | rswalowe2@dmoz.org             | 2024-12-06 | 2.74        | 1         |

It's easy to translate the `group by` query we wrote above to a query with a window function. Any row that has a dup_count greater than 1 is a duplicate of another row. However, our duplicate `group by` query had a `having` clause that filtered the results to only include rows that were duplicated. Unfortunately, we cannot filter the window function column in the `where` clause nor can we use the `having` clause in our query. To filter on this column we must use an inner query or a common table expression. Here's an example with a common table expression.

```SQL
with cte as (select first_name,
                    last_name,
                    email,
                    the_date,
                    total_spend,
                    count(*) over (partition by email, the_date) as dup_count
             from daily_user_spend)
select *
from cte
where dup_count > 1
order by email, the_date;
```
| first_name | last_name | email                 | the_date   | total_spend | dup_count |
|------------|-----------|-----------------------|------------|-------------|-----------|
| Celeste    | Waistell  | cwaistell0@cpanel.net | 2024-12-02 | 11.27       | 2         |
| Celeste    | Waistell  | cwaistell0@cpanel.net | 2024-12-02 | -3.97       | 2         |
| Jayne      | Miner     | jminer4@qq.com        | 2024-12-02 | 5.88        | 2         |
| Jane       | Miner     | jminer4@qq.com        | 2024-12-02 | 5.88        | 2         |
| --         | --        | --                    | --         | --          | --        |
| Jayne      | Miner     | jminer4@qq.com        | 2024-12-06 | 11.38       | 2         |
| Jane       | Miner     | jminer4@qq.com        | 2024-12-06 | 11.38       | 2         |
| Reece      | Swalowe   | rswalowe2@dmoz.org    | 2024-12-01 | 9.64        | 2         |
| Reece      | Swalowe   | rswalowe2@dmoz.org    | 2024-12-01 | -9.64       | 2         |

I've added the `order by` clause in the query to ensure that rows that are duplicates of each other appear next to each other[^1]. We can now get a clue of what might have gone wrong to produce the duplicates. The rows of Celeste and Reece have different total_spend amounts in their duplicated rows. It also looks like every row for Jayne (or is it Jane?) has been duplicated, because of the different first name. We can now pass this information on to the dataset owner.

This is one of my most frequently used queries when doing data exploration, so I hope you also find it useful. There are many other ways which window functions can be useful which I will share later.


[^1]: It's often not necessary to use the order by clause, because the sql engine needs to do the order by anyway to determine the duplicates, so your results will often be ordered in this way already. However, this is not a guarantee, so it's best to keep it in.
