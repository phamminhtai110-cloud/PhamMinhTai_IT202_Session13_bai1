

USE RikkeiClinicDB;

UPDATE Appointments
SET appointment_date = '2025-01-15 08:00:00'
WHERE appointment_id = 104;

DROP TRIGGER IF EXISTS PreventPastAppointments;


-- Tạo lại trigger đúng logic

DELIMITER //

CREATE TRIGGER PreventPastAppointments
BEFORE UPDATE ON Appointments
FOR EACH ROW
BEGIN

    -- Kiểm tra ngày khám mới
    IF NEW.appointment_date < NOW() THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Khong the doi lich kham ve qua khu';

    END IF;

END //

DELIMITER ;

UPDATE Appointments
SET appointment_date = '2025-01-10 09:00:00'
WHERE appointment_id = 104;


-- Test đúng: được phép update

UPDATE Appointments
SET appointment_date = '2027-08-20 14:00:00'
WHERE appointment_id = 104;


-- Xem kết quả cuối cùng

SELECT *
FROM Appointments
WHERE appointment_id = 104;