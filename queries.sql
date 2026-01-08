--most borrowed books
SELECT b.title, COUNT(*) AS issue_count
FROM book_issues bi
JOIN books b ON bi.book_id = b.book_id
GROUP BY b.title
ORDER BY issue_count DESC;

--members with highest fine
SELECT m.name, SUM(bi.fine) AS total_fine
FROM book_issues bi
JOIN members m ON bi.member_id = m.member_id
GROUP BY m.name
ORDER BY total_fine DESC;

--members currently holding a book
SELECT 
    m.member_id,
    m.name,
    b.title,
    bi.issue_date,
    bi.due_date
FROM book_issues bi
JOIN members m ON bi.member_id = m.member_id
JOIN books b ON bi.book_id = b.book_id
WHERE bi.return_date IS NULL;

--members with overdue and expected fine
SELECT 
    m.name,
    b.title,
    bi.due_date,
    DATEDIFF(CURRENT_DATE, bi.due_date) * 5 AS expected_fine
FROM book_issues bi
JOIN members m ON bi.member_id = m.member_id
JOIN books b ON bi.book_id = b.book_id
WHERE bi.return_date IS NULL
AND bi.due_date < CURRENT_DATE;

--most active library members
SELECT 
    m.name,
    COUNT(bi.issue_id) AS total_issues
FROM book_issues bi
JOIN members m ON bi.member_id = m.member_id
GROUP BY m.name
ORDER BY total_issues DESC;

--books with demand higher than supply
SELECT 
    b.title,
    COUNT(r.reservation_id) AS waiting_requests,
    b.available_copies
FROM books b
JOIN reservations r ON b.book_id = r.book_id
WHERE r.status = 'WAITING'
GROUP BY b.title, b.available_copies
HAVING waiting_requests > b.available_copies;
