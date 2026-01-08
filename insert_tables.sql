INSERT INTO members (name, email, status) VALUES
('Amit Sharma', 'amit.sharma@gmail.com', 'ACTIVE'),
('Neha Verma', 'neha.verma@gmail.com', 'ACTIVE'),
('Rahul Singh', 'rahul.singh@gmail.com', 'BLOCKED'),
('Priya Mehta', 'priya.mehta@gmail.com', 'ACTIVE');

INSERT INTO books (title, isbn, total_copies, available_copies) VALUES
('Clean Code', '9780132350884', 5, 5),
('Harry Potter and the Sorcerer''s Stone', '9780439708180', 4, 4),
('1984', '9780451524935', 3, 3),
('The Da Vinci Code', '9780307474278', 2, 2);

INSERT INTO authors (author_name) VALUES
('Robert C. Martin'),
('J.K. Rowling'),
('George Orwell'),
('Dan Brown');

INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1), -- Clean Code → Robert C. Martin
(2, 2), -- Harry Potter → J.K. Rowling
(3, 3), -- 1984 → George Orwell
(4, 4); -- Da Vinci Code → Dan Brown
