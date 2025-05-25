CREATE TRIGGER prevent_event_before_birth
BEFORE INSERT ON Event
FOR EACH ROW
BEGIN
    DECLARE patient_dob DATE;
    SELECT date_of_birth INTO patient_dob FROM Patient WHERE patient_id = NEW.patient_id;
    
    IF NEW.event_date < patient_dob THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Event date cannot be before patient date of birth.';
    END IF;
END;
CREATE TABLE Doctor_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
    old_specialty VARCHAR(100),
    new_specialty VARCHAR(100),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER log_doctor_specialty_update
BEFORE UPDATE ON Doctor
FOR EACH ROW
BEGIN
    IF OLD.specialty <> NEW.specialty THEN
        INSERT INTO Doctor_Audit (doctor_id, old_specialty, new_specialty)
        VALUES (OLD.doctor_id, OLD.specialty, NEW.specialty);
    END IF;
END;
CREATE TRIGGER delete_prescriptions_on_event_delete
AFTER DELETE ON Event
FOR EACH ROW
BEGIN
    DELETE FROM Prescription WHERE event_id = OLD.event_id;
END;
CREATE TRIGGER capitalize_patient_names
BEFORE INSERT ON Patient
FOR EACH ROW
BEGIN
    SET NEW.first_name = CONCAT(UCASE(LEFT(NEW.first_name,1)), LCASE(SUBSTRING(NEW.first_name,2)));
    SET NEW.last_name = CONCAT(UCASE(LEFT(NEW.last_name,1)), LCASE(SUBSTRING(NEW.last_name,2)));
END;
