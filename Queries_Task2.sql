INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address) VALUES
('Pranesh', 'R', '2004-01-18', 'rspranesh18@gmail.com', '8489289898', 'HNO-01 Main Street'),
('Manovishaal', 'D', '2004-04-29', 'manovishaal@gmail.com', '9345678901', 'HNO-02 Main Street'),
('Promoth', 'V', '2004-05-02', 'promoth@gmail.com', '9456789012', 'HNO-03 Main Street'),
('Naren', 'P', '2004-09-11', 'naren@gmail.com', '9567890123', 'HNO-04 Main Street'),
('Jeyasundar', 'R', '2004-04-29', 'jeyasundar@gmail.com', '9678901234', 'HNO-05 Main Street');

INSERT INTO Accounts (customer_id, account_type, balance) VALUES
(1, 'savings', 5000.00),
(2, 'current', 40000.00),
(3, 'savings', 20000.00),
(4, 'current', 25000.00),
(5, 'zero_balance', 0.00);

INSERT INTO Transactions (account_id, transaction_type, amount) VALUES
(1, 'deposit', 1000.00),
(2, 'withdrawal', 500.00),
(3, 'deposit', 3000.00),
(4, 'transfer', 2000.00),
(5, 'deposit', 1500.00);
