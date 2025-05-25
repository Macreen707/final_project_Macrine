CREATE OR REPLACE FUNCTION get_patient_age(
    p_patient_id IN Patient.patient_id%TYPE
) RETURN NUMBER IS
    v_dob DATE;
    v_age NUMBER;
BEGIN
    SELECT date_of_birth INTO v_dob FROM Patient WHERE patient_id = p_patient_id;
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);
    RETURN v_age;
END;
CREATE OR REPLACE FUNCTION get_patient_event_count(
    p_patient_id IN Event.patient_id%TYPE
) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM Event WHERE patient_id = p_patient_id;
    RETURN v_count;
END;
CREATE OR REPLACE FUNCTION get_doctor_full_name(
    p_doctor_id IN Doctor.doctor_id%TYPE
) RETURN VARCHAR2 IS
    v_name VARCHAR2(150);
BEGIN
    SELECT first_name || ' ' || last_name INTO v_name FROM Doctor WHERE doctor_id = p_doctor_id;
    RETURN v_name;
END;
CREATE OR REPLACE FUNCTION has_prescription(
    p_patient_id IN Patient.patient_id%TYPE
) RETURN BOOLEAN IS
    v_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_exists
    FROM Event e
    JOIN Prescription p ON e.event_id = p.event_id
    WHERE e.patient_id = p_patient_id;

    RETURN v_exists > 0;
END;
CREATE OR REPLACE FUNCTION count_diagnosis_by_code(
    p_code IN Diagnosis.code%TYPE
) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM Diagnosis WHERE code = p_code;
    RETURN v_count;
END;
CREATE OR REPLACE FUNCTION most_common_diagnosis RETURN VARCHAR2 IS
    v_code VARCHAR2(10);
BEGIN
    SELECT code INTO v_code
    FROM (
        SELECT code, COUNT(*) AS freq
        FROM Diagnosis
        GROUP BY code
        ORDER BY freq DESC
    )
    WHERE ROWNUM = 1;

    RETURN v_code;
END;


