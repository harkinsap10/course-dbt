--Number of Users--
-- 130
SELECT count(distinct user_id) as users
FROM dev_db.harkinsapgmailcom.stg_postgres__users
;

--On average, how many orders do we receieve per hour?--
-- 7.68

SELECT 
    count(distinct order_id) as order_count
  , min(created_at) as min_time
  , max(created_at) as max_time
  , order_count / datediff('hour',min_time,max_time) as orders_per_hour
FROM dev_db.harkinsapgmailcom.stg_postgres__orders
;

--On average, how long does an order take from being place to being delivered?--
-- 3.89 days
SELECT avg(datediff('day',created_at,delivered_at)) as processing_time_in_days
FROM dev_db.harkinsapgmailcom.stg_postgres__orders
WHERE 1=1
AND status = 'delivered'
--GROUP BY 1
;

--How many users have only made one purchase? Two purchases? Three+ purchases?--

Answer: 
ORDER_COUNT	USER_COUNT
1	25
2	28
3	34
4	20
5	10
6	2
7	4
8	1 

with t1 as (
SELECT user_id, count(distinct order_id) as order_count
FROM dev_db.harkinsapgmailcom.stg_postgres__orders
WHERE 1=1
GROUP BY 1
)

SELECT order_count, count(distinct user_id) as user_count
FROM t1
WHERE 1=1
GROUP BY 1
ORDER BY 1
;

--On average, how many unique sessions do we have per hour?
Answer: 10.14
SELECT 
    count(distinct session_id) as session_count
  , min(created_at) as min_time
  , max(created_at) as max_time
  , session_count / datediff('hour',min_time,max_time) as sessions_per_hour
FROM dev_db.harkinsapgmailcom.stg_postgres__events
;