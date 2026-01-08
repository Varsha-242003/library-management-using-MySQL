CREATE VIEW overdue_books AS
SELECT 
    m.name AS member_name,
    b.title,
    bi.due_date,
    DATEDIFF(CURRENT_DATE, bi.due_date) AS days_overdue
FROM book_issues bi
JOIN members m ON bi.member_id = m.member_id
JOIN books b ON bi.book_id = b.book_id
WHERE bi.return_date IS NULL
AND bi.due_date < CURRENT_DATE;
