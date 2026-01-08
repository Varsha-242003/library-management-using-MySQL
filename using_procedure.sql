CALL issue_book(1, 1); -- Clean Code → Amit
CALL issue_book(2, 2); -- Harry Potter → Neha
CALL issue_book(3, 4); -- 1984 → Priya

--insert reservation when book unavailable
INSERT INTO reservations (book_id, member_id)
VALUES
(1, 2), -- Neha waiting for Clean Code
(1, 4); -- Priya waiting for Clean Code

--trigger fine for late return
UPDATE book_issues
SET return_date = DATE_ADD(due_date, INTERVAL 5 DAY)
WHERE issue_id = 1;

