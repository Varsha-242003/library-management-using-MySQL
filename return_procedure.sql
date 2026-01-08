DELIMITER $$
CREATE PROCEDURE return_book(
    IN p_issue_id INT
)
BEGIN
    DECLARE v_book INT;

    SELECT book_id INTO v_book
    FROM book_issues WHERE issue_id = p_issue_id;

    UPDATE book_issues
    SET return_date = CURRENT_DATE
    WHERE issue_id = p_issue_id;

    UPDATE books
    SET available_copies = available_copies + 1
    WHERE book_id = v_book;

END$$
DELIMITER ;
