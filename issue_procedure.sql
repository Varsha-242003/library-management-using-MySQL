DELIMITER $$
CREATE PROCEDURE issue_book(
    IN p_book_id INT,
    IN p_member_id INT
)
BEGIN
    DECLARE copies INT;

    SELECT available_copies INTO copies
    FROM books WHERE book_id = p_book_id;

    IF copies > 0 THEN
        INSERT INTO book_issues(book_id, member_id, due_date)
        VALUES (p_book_id, p_member_id, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY));

        UPDATE books
        SET available_copies = available_copies - 1
        WHERE book_id = p_book_id;
    ELSE
        INSERT INTO reservations(book_id, member_id)
        VALUES (p_book_id, p_member_id);
    END IF;
END$$
DELIMITER ;
