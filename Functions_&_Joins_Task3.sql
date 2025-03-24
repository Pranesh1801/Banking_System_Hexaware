SELECT DISTINCT Customers.first_name, Customers.last_name 
FROM Customers 
JOIN Accounts ON Customers.customer_id = Accounts.customer_id
JOIN Transactions ON Accounts.account_id = Transactions.account_id
WHERE Transactions.transaction_type = 'deposit';

SELECT account_id, COUNT(transaction_id) AS transaction_count 
FROM Transactions 
GROUP BY account_id;

SELECT Customers.first_name, Customers.last_name 
FROM Customers 
JOIN Accounts AS a1 ON Customers.customer_id = a1.customer_id AND a1.account_type = 'savings'
JOIN Accounts AS a2 ON Customers.customer_id = a2.customer_id AND a2.account_type = 'current';

SELECT Customers.first_name, Customers.last_name, SUM(Accounts.balance) AS total_balance 
FROM Customers 
JOIN Accounts ON Customers.customer_id = Accounts.customer_id 
GROUP BY Customers.customer_id;

SELECT * FROM Transactions 
WHERE transaction_date >= CURDATE() - INTERVAL 30 DAY;

SELECT Accounts.account_id, Accounts.account_type 
FROM Accounts 
LEFT JOIN Transactions ON Accounts.account_id = Transactions.account_id 
WHERE Transactions.transaction_id IS NULL;

SELECT account_id, MAX(transaction_date) AS last_transaction_date 
FROM Transactions 
GROUP BY account_id;

SELECT account_id, MAX(amount) AS highest_deposit 
FROM Transactions 
WHERE transaction_type = 'deposit' 
GROUP BY account_id;

SELECT account_type, AVG(balance) AS avg_balance 
FROM Accounts 
GROUP BY account_type;

SELECT t1.* 
FROM Transactions t1
WHERE transaction_date = (
    SELECT MAX(transaction_date) 
    FROM Transactions t2 
    WHERE t1.account_id = t2.account_id
);

SELECT Customers.first_name, Customers.last_name, COUNT(Accounts.account_id) AS account_count 
FROM Customers 
JOIN Accounts ON Customers.customer_id = Accounts.customer_id 
GROUP BY Customers.customer_id 
HAVING COUNT(Accounts.account_id) > 1;

SELECT transaction_type, COUNT(transaction_id) AS count 
FROM Transactions 
GROUP BY transaction_type 
ORDER BY count DESC 
LIMIT 1;

SELECT account_id, 
       SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) AS total_deposits, 
       SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS total_withdrawals 
FROM Transactions 
GROUP BY account_id;

SELECT Customers.first_name, Customers.last_name, SUM(Accounts.balance) AS total_balance 
FROM Customers 
JOIN Accounts ON Customers.customer_id = Accounts.customer_id 
GROUP BY Customers.customer_id 
ORDER BY total_balance DESC 
LIMIT 3;
