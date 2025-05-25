CREATE OR REPLACE PROCEDURE add_patient (
    p_patient_id    IN Patient.patient_id%TYPE,
    p_first_name    IN Patient.first_name%TYPE,
    p_last_name     IN Patient.last_name%TYPE,
    p_dob           IN Patient.date_of_birth%TYPE,
    p_gender        IN Patient.gender%TYPE,
    p_address       IN Patient.address%TYPE,
    p_phone_number  IN Patient.phone_number%TYPE
) AS
BEGIN
    INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, address, phone_number)
    VALUES (p_patient_id, p_first_name, p_last_name, p_dob, p_gender, p_address, p_phone_number);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding patient: ' || SQLERRM);
END;
CREATE OR REPLACE PROCEDURE add_doctor (
    p_doctor_id     IN Doctor.doctor_id%TYPE,
    p_first_name    IN Doctor.first_name%TYPE,
    p_last_name     IN Doctor.last_name%TYPE,
    p_specialty     IN Doctor.specialty%TYPE,
    p_phone_number  IN Doctor.phone_number%TYPE,
    p_email         IN Doctor.email%TYPE
) AS
BEGIN
    INSERT INTO Doctor (doctor_id, first_name, last_name, specialty, phone_number, email)
    VALUES (p_doctor_id, p_first_name, p_last_name, p_specialty, p_phone_number, p_email);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding doctor: ' || SQLERRM);
END;
CREATE OR REPLACE PROCEDURE add_event (
    p_event_id      IN Event.event_id%TYPE,
    p_patient_id    IN Event.patient_id%TYPE,
    p_doctor_id     IN Event.doctor_id%TYPE,
    p_event_type    IN Event.event_type%TYPE,
    p_event_date    IN Event.event_date%TYPE,
    p_notes         IN Event.notes%TYPE
) AS
    v_dob DATE;
BEGIN
    SELECT date_of_birth INTO v_dob FROM Patient WHERE patient_id = p_patient_id;

    IF p_event_date < v_dob THEN
        RAISE_APPLICATION_ERROR(-20001, 'Event date cannot be before patient''s birth date.');
    END IF;

    INSERT INTO Event (event_id, patient_id, doctor_id, event_type, event_date, notes)
    VALUES (p_event_id, p_patient_id, p_doctor_id, p_event_type, p_event_date, p_notes);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Patient not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding event: ' || SQLERRM);
END;
CREATE OR REPLACE PROCEDURE update_patient_phone (
    p_patient_id      IN Patient.patient_id%TYPE,
    p_new_phone       IN Patient.phone_number%TYPE
) AS
BEGIN
    UPDATE Patient
    SET phone_number = p_new_phone
    WHERE patient_id = p_patient_id;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No patient found with that ID.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Phone number updated.');
    END IF;
END;
BEGIN
    add_patient(1005, 'Jane', 'Smith', DATE '1990-05-15', 'F', '789 Oak St', '555-6789');
END;


