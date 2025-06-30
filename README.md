# 📘 SQL Internship – Task 5

---

## ✅ Objective

- Create and link multiple tables using foreign keys
- Practice and demonstrate:
  - `INNER JOIN`
  - `LEFT JOIN`
  - `RIGHT JOIN`
  - Simulated `FULL OUTER JOIN`
  - Cartesian Product
- Understand how data relationships work across tables

---

## 🗃️ Tables Used

### `customers`

| Column        | Type         | Description                      |
|---------------|--------------|----------------------------------|
| customer_id   | INT          | Primary Key, Auto-Increment      |
| name          | VARCHAR(100) | Customer's name                  |
| email         | VARCHAR(100) | Email address                    |
| amount_spent  | INT          | Total spent by the customer      |

### `orders`

| Column       | Type    | Description                            |
|--------------|---------|----------------------------------------|
| order_id     | INT     | Primary Key, Auto-Increment            |
| customer_id  | INT     | Foreign Key → `customers.customer_id` |
| order_date   | DATE    | Date of order                          |
| amount       | INT     | Amount spent on that order             |

---

## 📥 Sample Data

### 🧑 customers

```text
+-------------+--------------+--------------------+--------------+
| customer_id | name         | email              | amount_spent |
+-------------+--------------+--------------------+--------------+
| 1           | Naveen Kumar | naveen@example.com |        1500  |
| 2           | Asha Rao     | asha@example.com   |        2000  |
| 3           | madhu        | madhu89@gmail.com  |        1500  |
| 4           | Kutty        | kutty90@gmail      |        1000  |
| 5           | keerthi      | keerthi12@gmail    |        2000  |
+-------------+--------------+--------------------+--------------+
