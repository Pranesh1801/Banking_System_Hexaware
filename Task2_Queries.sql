INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address) VALUES
('Pranesh', 'R', '2004-01-18', 'rspranesh18@gmail.com', '8489289898', 'HNO-01 Main Street'),
('Manovishaal', 'D', '2004-04-29', 'manovishaal@gmail.com', '9345678901', 'HNO-02 Main Street'),
('Promoth', 'V', '2004-05-02', 'promoth@gmail.com', '9456789012', 'HNO-03 Main Street'),
('Naren', 'P', '2004-09-11', 'naren@gmail.com', '9567890123', 'HNO-04 Main Street'),
('Jeyasundar', 'R', '2004-04-29', 'jeyasundar@gmail.com', '9678901234', 'HNO-05 Main Street');
('Dhanush', 'T', '2004-07-8', 'dhanush@gmail.com', '8489289818', 'HNO-06 Main Street'),
('Joseph', 'B', '2004-08-29', 'joseph@gmail.com', '8345678901', 'HNO-07 Main Street'),
('Hari', 'T', '2004-06-12', 'hari@gmail.com', '9456289012', 'HNO-08 Main Street'),
('Calvin', 'M', '2004-09-11', 'calvin@gmail.com', '9567890523', 'HNO-09 Main Street'),
('Ahamed', 'T', '2004-01-29', 'ahamed@gmail.com', '9678991234', 'HNO-10 Main Street');

INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(101, 1, 'savings', 5000.00),
(102, 2, 'current', 40000.00),
(103, 3, 'zero_balance', 0.00),
(104, 4, 'savings', 28000.00),
(105, 5, 'current', 15000.00),
(106, 6, 'savings', 82000.00),
(107, 7, 'current', 42000.00),
(108, 8, 'savings', 59500.00),
(109, 9, 'zero_balance', 0.00),
(110, 10, 'current', 500.00);

INSERT INTO Transactions (account_id, transaction_type, amount) VALUES
(1, 101, 'deposit', 1000.00, '2025-03-01'),
(2, 102, 'withdrawal', 2000.00, '2025-03-02'),
(3, 103, 'deposit', 500.00, '2025-03-03'),
(4, 104, 'transfer', 1500.00, '2025-03-04'),
(5, 105, 'deposit', 3000.00, '2025-03-05'),
(6, 106, 'withdrawal', 800.00, '2025-03-06'),
(7, 107, 'deposit', 7000.00, '2025-03-07'),
(8, 108, 'transfer', 2500.00, '2025-03-08'),
(9, 109, 'deposit', 100.00, '2025-03-09'),
(10, 110, 'withdrawal', 200.00, '2025-03-10');

SELECT first_name, last_name, account_type, email 
FROM Customers 
JOIN Accounts ON Customers.customer_id = Accounts.customer_id;

SELECT Customers.first_name, Customers.last_name, Transactions.transaction_type, Transactions.amount, Transactions.transaction_date 
FROM Customers
JOIN Accounts ON Customers.customer_id = Accounts.customer_id
JOIN Transactions ON Accounts.account_id = Transactions.account_id;

UPDATE Accounts 
SET balance = balance + 500 
WHERE account_id = 101;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Customers;

DELETE FROM Accounts 
WHERE balance = 0 AND account_type = 'savings';

SELECT * FROM Customers WHERE address LIKE '%street%';

SELECT balance FROM Accounts WHERE account_id = 101;

SELECT * FROM Accounts WHERE account_type = 'current' AND balance > 1000;

SELECT * FROM Transactions WHERE account_id = 102;

SELECT account_id, balance, balance * 0.05 AS interest_amount 
FROM Accounts WHERE account_type = 'savings';

SELECT * FROM Accounts WHERE balance < 500;

SELECT * FROM Customers WHERE address NOT LIKE '%street%';
