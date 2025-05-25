CREATE OR REPLACE PACKAGE healthcare_pkg AS

    -- Procedure to register a new patient
    PROCEDURE register_patient(
        p_patient_id    IN Patient.patient_id%TYPE,
        p_first_name    IN Patient.first_name%TYPE,
        p_last_name     IN Patient.last_name%TYPE,
        p_dob           IN Patient.date_of_birth%TYPE,
        p_gender        IN Patient.gender%TYPE,
        p_address       IN Patient.address%TYPE,
        p_phone_number  IN Patient.phone_number%TYPE
    );

    -- Procedure to register a new doctor
    PROCEDURE register_doctor(
        p_doctor_id     IN Doctor.doctor_id%TYPE,
        p_first_name    IN Doctor.first_name%TYPE,
        p_last_name     IN Doctor.last_name%TYPE,
        p_specialty     IN Doctor.specialty%TYPE,
        p_phone_number  IN Doctor.phone_number%TYPE,
        p_email         IN Doctor.email%TYPE
    );

    -- Procedure to add a new event
    PROCEDURE add_event(
        p_event_id      IN Event.event_id%TYPE,
        p_patient_id    IN Event.patient_id%TYPE,
        p_doctor_id     IN Event.doctor_id%TYPE,
        p_event_type    IN Event.event_type%TYPE,
        p_event_date    IN Event.event_date%TYPE,
        p_notes         IN Event.notes%TYPE
    );

    -- Function to get total events for a doctor
    FUNCTION get_doctor_event_count(
        p_doctor_id IN Doctor.doctor_id%TYPE
    ) RETURN NUMBER;

END healthcare_pkg;
CREATE OR REPLACE PACKAGE BODY healthcare_pkg AS

    PROCEDURE register_patient(
        p_patient_id    IN Patient.patient_id%TYPE,
        p_first_name    IN Patient.first_name%TYPE,
        p_last_name     IN Patient.last_name%TYPE,
        p_dob           IN Patient.date_of_birth%TYPE,
        p_gender        IN Patient.gender%TYPE,
        p_address       IN Patient.address%TYPE,
        p_phone_number  IN Patient.phone_number%TYPE
    ) IS
    BEGIN
        INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, address, phone_number)
        VALUES (p_patient_id, p_first_name, p_last_name, p_dob, p_gender, p_address, p_phone_number);
    END register_patient;

    PROCEDURE register_doctor(
        p_doctor_id     IN Doctor.doctor_id%TYPE,
        p_first_name    IN Doctor.first_name%TYPE,
        p_last_name     IN Doctor.last_name%TYPE,
        p_specialty     IN Doctor.specialty%TYPE,
        p_phone_number  IN Doctor.phone_number%TYPE,
        p_email         IN Doctor.email%TYPE
    ) IS
    BEGIN
        INSERT INTO Doctor (doctor_id, first_name, last_name, specialty, phone_number, email)
        VALUES (p_doctor_id, p_first_name, p_last_name, p_specialty, p_phone_number, p_email);
    END register_doctor;

    PROCEDURE add_event(
        p_event_id      IN Event.event_id%TYPE,
        p_patient_id    IN Event.patient_id%TYPE,
        p_doctor_id     IN Event.doctor_id%TYPE,
        p_event_type    IN Event.event_type%TYPE,
        p_event_date    IN Event.event_date%TYPE,
        p_notes         IN Event.notes%TYPE
    ) IS
        v_dob DATE;
    BEGIN
        SELECT date_of_birth INTO v_dob FROM Patient WHERE patient_id = p_patient_id;

        IF p_event_date < v_dob THEN
            RAISE_APPLICATION_ERROR(-20001, 'Event date cannot be before patient''s birth date.');
        END IF;

        INSERT INTO Event (event_id, patient_id, doctor_id, event_type, event_date, notes)
        VALUES (p_event_id, p_patient_id, p_doctor_id, p_event_type, p_event_date, p_notes);
    END add_event;

    FUNCTION get_doctor_event_count(
        p_doctor_id IN Doctor.doctor_id%TYPE
    ) RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM Event
        WHERE doctor_id = p_doctor_id;

        RETURN v_count;
    END get_doctor_event_count;

END healthcare_pkg;
BEGIN
    healthcare_pkg.register_patient(1001, 'John', 'Doe', DATE '1985-06-01', 'M', '123 Main St', '555-1234');
END;
BEGIN
    healthcare_pkg.add_event(2001, 1001, 3001, 'Checkup', DATE '2023-05-10', 'Routine visit');
END;
DECLARE
    v_count NUMBER;
BEGIN
    v_count := healthcare_pkg.get_doctor_event_count(3001);
    DBMS_OUTPUT.PUT_LINE('Total events: ' || v_count);
END;

