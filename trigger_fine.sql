DELIMITER $$

CREATE TRIGGER calculate_fine
BEFORE UPDATE ON book_issues
FOR EACH ROW
BEGIN
    IF NEW.return_date IS NOT NULL AND NEW.return_date > OLD.due_date THEN
        SET NEW.fine =
            DATEDIFF(NEW.return_date, OLD.due_date) * 5;
    END IF;
END$$

DELIMITER ;
