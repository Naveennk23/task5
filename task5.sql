mysql> select * from customers;
+-------------+--------------+--------------------+--------------+
| customer_id | name         | email              | amount_spent |
+-------------+--------------+--------------------+--------------+
|           1 | Naveen Kumar | naveen@example.com |         1500 |
|           2 | Asha Rao     | asha@example.com   |         2000 |
|           3 | madhu        | madhu89@gmail.com  |         1500 |
|           4 | Kutty        | kutty90@gmail      |         1000 |
|           5 | keerthi      | keerthi12@gmail    |         2000 |
+-------------+--------------+--------------------+--------------+
5 rows in set (0.04 sec)

mysql> CREATE TABLE orders (
    ->     order_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     customer_id INT,
    ->     order_date DATE,
    ->     amount INT,
    ->     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    -> );
Query OK, 0 rows affected (0.27 sec)

mysql> INSERT INTO orders (customer_id, order_date, amount) VALUES
    -> (1, '2024-06-01', 500),
    -> (1, '2024-06-10', 1000),
    -> (2, '2024-06-15', 2000),
    -> (4, '2024-06-20', 1000);
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT customers.name, orders.order_id, orders.amount
    -> FROM customers
    -> INNER JOIN orders ON customers.customer_id = orders.customer_id;
+--------------+----------+--------+
| name         | order_id | amount |
+--------------+----------+--------+
| Naveen Kumar |        1 |    500 |
| Naveen Kumar |        2 |   1000 |
| Asha Rao     |        3 |   2000 |
| Kutty        |        4 |   1000 |
+--------------+----------+--------+
4 rows in set (0.02 sec)

mysql> SELECT customers.name, orders.order_id, orders.amount
    -> FROM customers
    -> LEFT JOIN orders ON customers.customer_id = orders.customer_id;
+--------------+----------+--------+
| name         | order_id | amount |
+--------------+----------+--------+
| Naveen Kumar |        1 |    500 |
| Naveen Kumar |        2 |   1000 |
| Asha Rao     |        3 |   2000 |
| madhu        |     NULL |   NULL |
| Kutty        |        4 |   1000 |
| keerthi      |     NULL |   NULL |
+--------------+----------+--------+
6 rows in set (0.00 sec)

mysql> SELECT customers.name, orders.order_id, orders.amount
    -> FROM customers
    -> RIGHT JOIN orders ON customers.customer_id = orders.customer_id;
+--------------+----------+--------+
| name         | order_id | amount |
+--------------+----------+--------+
| Naveen Kumar |        1 |    500 |
| Naveen Kumar |        2 |   1000 |
| Asha Rao     |        3 |   2000 |
| Kutty        |        4 |   1000 |
+--------------+----------+--------+
4 rows in set (0.00 sec)
mysql> SELECT customers.name, orders.order_id, orders.amount
    -> FROM customers
    -> LEFT JOIN orders ON customers.customer_id = orders.customer_id
    ->
    -> UNION
    ->
    -> SELECT customers.name, orders.order_id, orders.amount
    -> FROM customers
    -> RIGHT JOIN orders ON customers.customer_id = orders.customer_id;
+--------------+----------+--------+
| name         | order_id | amount |
+--------------+----------+--------+
| Naveen Kumar |        2 |   1000 |
| Naveen Kumar |        1 |    500 |
| Asha Rao     |        3 |   2000 |
| madhu        |     NULL |   NULL |
| Kutty        |        4 |   1000 |
| keerthi      |     NULL |   NULL |
+--------------+----------+--------+
6 rows in set (0.01 sec)
mysql> SELECT * FROM customers, orders;
+-------------+--------------+--------------------+--------------+----------+-------------+------------+--------+
| customer_id | name         | email              | amount_spent | order_id | customer_id | order_date | amount |
+-------------+--------------+--------------------+--------------+----------+-------------+------------+--------+
|           1 | Naveen Kumar | naveen@example.com |         1500 |        4 |           4 | 2024-06-20 |   1000 |
|           1 | Naveen Kumar | naveen@example.com |         1500 |        3 |           2 | 2024-06-15 |   2000 |
|           1 | Naveen Kumar | naveen@example.com |         1500 |        2 |           1 | 2024-06-10 |   1000 |
|           1 | Naveen Kumar | naveen@example.com |         1500 |        1 |           1 | 2024-06-01 |    500 |
|           2 | Asha Rao     | asha@example.com   |         2000 |        4 |           4 | 2024-06-20 |   1000 |
|           2 | Asha Rao     | asha@example.com   |         2000 |        3 |           2 | 2024-06-15 |   2000 |
|           2 | Asha Rao     | asha@example.com   |         2000 |        2 |           1 | 2024-06-10 |   1000 |
|           2 | Asha Rao     | asha@example.com   |         2000 |        1 |           1 | 2024-06-01 |    500 |
|           3 | madhu        | madhu89@gmail.com  |         1500 |        4 |           4 | 2024-06-20 |   1000 |
|           3 | madhu        | madhu89@gmail.com  |         1500 |        3 |           2 | 2024-06-15 |   2000 |
|           3 | madhu        | madhu89@gmail.com  |         1500 |        2 |           1 | 2024-06-10 |   1000 |
|           3 | madhu        | madhu89@gmail.com  |         1500 |        1 |           1 | 2024-06-01 |    500 |
|           4 | Kutty        | kutty90@gmail      |         1000 |        4 |           4 | 2024-06-20 |   1000 |
|           4 | Kutty        | kutty90@gmail      |         1000 |        3 |           2 | 2024-06-15 |   2000 |
|           4 | Kutty        | kutty90@gmail      |         1000 |        2 |           1 | 2024-06-10 |   1000 |
|           4 | Kutty        | kutty90@gmail      |         1000 |        1 |           1 | 2024-06-01 |    500 |
|           5 | keerthi      | keerthi12@gmail    |         2000 |        4 |           4 | 2024-06-20 |   1000 |
|           5 | keerthi      | keerthi12@gmail    |         2000 |        3 |           2 | 2024-06-15 |   2000 |
|           5 | keerthi      | keerthi12@gmail    |         2000 |        2 |           1 | 2024-06-10 |   1000 |
|           5 | keerthi      | keerthi12@gmail    |         2000 |        1 |           1 | 2024-06-01 |    500 |
+-------------+--------------+--------------------+--------------+----------+-------------+------------+--------+
20 rows in set (0.02 sec)