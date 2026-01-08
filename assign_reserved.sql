DELIMITER $$

CREATE TRIGGER assign_reserved_book
AFTER UPDATE ON books
FOR EACH ROW
BEGIN
    DECLARE v_member INT;

    IF NEW.available_copies > 0 THEN
        SELECT member_id INTO v_member
        FROM reservations
        WHERE book_id = NEW.book_id AND status = 'WAITING'
        ORDER BY reservation_date
        LIMIT 1;

        IF v_member IS NOT NULL THEN
            CALL issue_book(NEW.book_id, v_member);

            UPDATE reservations
            SET status = 'COMPLETED'
            WHERE book_id = NEW.book_id AND member_id = v_member;
        END IF;
    END IF;
END$$

DELIMITER ;
