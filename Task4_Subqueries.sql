SELECT Customers.first_name, Customers.last_name, Accounts.balance 
FROM Customers 
JOIN Accounts ON Customers.customer_id = Accounts.customer_id 
WHERE Accounts.balance = (SELECT MAX(balance) FROM Accounts);

SELECT AVG(balance) AS avg_balance 
FROM Accounts 
WHERE customer_id IN (
    SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(account_id) > 1
);

SELECT * FROM Transactions 
WHERE amount > (SELECT AVG(amount) FROM Transactions);

SELECT Customers.first_name, Customers.last_name 
FROM Customers 
LEFT JOIN Accounts ON Customers.customer_id = Accounts.customer_id 
LEFT JOIN Transactions ON Accounts.account_id = Transactions.account_id 
WHERE Transactions.transaction_id IS NULL;

SELECT SUM(balance) AS total_balance_no_transactions 
FROM Accounts 
WHERE account_id NOT IN (SELECT DISTINCT account_id FROM Transactions);

SELECT * FROM Transactions 
WHERE account_id IN (SELECT account_id FROM Accounts WHERE balance = (SELECT MIN(balance) FROM Accounts));

SELECT Customers.first_name, Customers.last_name 
FROM Customers 
WHERE customer_id IN (
    SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(DISTINCT account_type) > 1
);

SELECT account_type, 
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts)) AS percentage 
FROM Accounts 
GROUP BY account_type;

SELECT Transactions.* 
FROM Transactions 
JOIN Accounts ON Transactions.account_id = Accounts.account_id 
WHERE Accounts.customer_id = (SELECT customer_id FROM Customers WHERE customer_id = 1);

SELECT account_type, 
       (SELECT SUM(balance) FROM Accounts a WHERE a.account_type = Accounts.account_type) AS total_balance 
FROM Accounts 
GROUP BY account_type;    
