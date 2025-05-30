SINGIZA GIHOZO MACRINE 
27677
TUES B PL WORK
Date: May 24, 2025

Slide 2: Problem Definition
Problem:
Patients struggling with drug addiction often face a fragmented and inefficient care system. This leads to:

Lack of Coordinated Care: Patients may interact with multiple providers (e.g., emergency services, detox centers, therapists, social workers) whose information systems are disconnected.
Incomplete Patient History: Critical data regarding a patient's addiction history, previous treatments, relapses, co-occurring mental health issues, and socio-economic factors are often siloed or manually recorded.
Ineffective Tracking of Progress and Outcomes: It's challenging to consistently monitor a patient's journey, assess the effectiveness of interventions, or identify patterns contributing to relapse.
Administrative Burden: Healthcare providers spend excessive time on manual data entry, information retrieval, and communication, diverting resources from direct patient care.
Privacy and Security Concerns: Manual or disparate systems increase the risk of data breaches and non-compliance with privacy regulations (e.g., HIPAA).
Impact:

Higher rates of relapse and readmission.
Increased healthcare costs due to inefficient resource allocation.
Compromised patient safety and quality of care.
Difficulty in reporting on public health trends and treatment efficacy.
Slide 3: Context
The Growing Crisis:
Drug addiction remains a significant public health crisis globally, leading to substantial societal and economic costs. Effective treatment requires a holistic, long-term approach encompassing medical, psychological, and social support.
![save macrine](https://github.com/user-attachments/assets/6b59418e-1958-4550-b262-219604c21c3d)

Current Landscape Challenges:
![macrine grant](https://github.com/user-attachments/assets/2569ec70-d612-4246-99c9-8efc417ffed6)

Diverse Stakeholders: Treatment involves hospitals, clinics, rehabilitation centers, outpatient programs, community support groups, and law enforcement.
Information Disparity: Each entity often uses its own system, if any, leading to inconsistent data formats, duplicate entries, and information gaps.
Transitional Care Gaps: Patients often fall through the cracks when transitioning between different levels of care (e.g., from inpatient detox to outpatient therapy).
Need for Data-Driven Decisions: To optimize treatment plans and allocate resources effectively, a comprehensive view of patient data and program performance is essential.
Regulatory Compliance: Strict regulations govern patient data privacy and reporting in healthcare.
Slide 4: Target Users
This integrated patient management system would serve a diverse group of users, each with specific needs:
![oracle](https://github.com/user-attachments/assets/70994e2c-cb10-404a-a605-96419a0f8561)
Automated Action: Triggers are database objects that run automatically (without being explicitly called) in response to certain events.
Event-Driven: They are activated by Data Manipulation Language (DML) events (like INSERT, UPDATE, DELETE on a table) or Data Definition Language (DDL) events (like CREATE, ALTER, DROP of a database object), or even database system events (like STARTUP or SHUTDOWN).
Purpose:
Enforce Complex Business Rules: Beyond simple CHECK constraints. For example, ensuring a new order can't exceed a customer's credit limit.
Maintain Data Integrity: Automatically updating related tables when changes occur in a primary table (e.g., updating stock levels after a sale).
Auditing and Logging: Recording who changed what, when, and from where.
Data Validation: Performing more complex validation checks before or after a data modification.
Replication: Synchronizing data between different databases.
Timing: Triggers can fire BEFORE or AFTER the triggering event.
BEFORE triggers are useful for data validation or modifying data before it's stored.
AFTER triggers are useful for actions that depend on the data being successfully committed, like logging.
Addiction Therapists/Counselors:
Access to patient history, progress notes, and treatment plans.
Tools for session tracking, goal setting, and progress monitoring.
Medical Doctors/Nurses:
View medical history, current medications, withdrawal symptoms, and co-occurring conditions.
Order and track lab tests, manage prescriptions.
Case Managers/Social Workers:
Track socio-economic factors, housing status, employment, and support networks.
Coordinate referrals to community resources.
Rehabilitation Center Staff:
Manage patient intake, daily schedules, group therapy participation.
Monitor patient behavior and progress within the facility.
Emergency Room Personnel:
Quick access to critical addiction history for immediate intervention and safe discharge planning.
System Administrators:
Manage user accounts, roles, permissions, and system configurations.
Oversee data security and backups.
Public Health Researchers/Policy Makers:
Access anonymized aggregate data for trend analysis, program evaluation, and policy development.
![trigger 1](https://github.com/user-attachments/assets/85afa2a0-54dc-4aaa-bb52-828f8dc9717d)
![trigger 2](https://github.com/user-attachments/assets/0affed08-f59a-417f-bc9f-241a2047be70)

Slide 5: Project Goals
The primary goals for developing an integrated patient management system for drug addiction are:
![advers table macrine](https://github.com/user-attachments/assets/5ee7f7b6-1b37-4207-b3bf-8cbeb23367ba)

Centralize Patient Data: Create a single, secure, and comprehensive repository for all patient-related information, accessible to authorized personnel across the care continuum.
Enhance Care Coordination: Facilitate seamless information exchange and communication between different healthcare providers and support services involved in a patient's care.
Improve Treatment Efficacy Tracking: Enable systematic monitoring of patient progress, treatment plan adherence, relapse incidents, and long-term outcomes.
Reduce Administrative Overhead: Automate routine tasks such as scheduling, billing, reporting, and data entry, freeing up provider time for patient interaction.
Ensure Data Integrity and Security: Implement robust data validation rules, audit trails, and access controls to maintain data quality and comply with privacy regulations.
Support Data-Driven Decision Making: Provide reporting and analytical tools for individual patient care optimization and broader program evaluation/resource allocation.
Facilitate Regulatory Reporting: Generate required reports for government agencies and funding bodies efficiently and accurately.
Slide 6: BPMN Diagram Description: Patient Admission and Initial Assessment
(Note: I cannot draw a diagram, but I will describe a simplified Business Process Model and Notation (BPMN) diagram for a typical patient admission and initial assessment flo![macrine alterd](https://github.com/user-attachments/assets/f50447ce-f4a4-4518-ac4c-70a01c69537f)
w.)
Reusable Code: Functions encapsulate a block of SQL or procedural code (like PL/SQL in Oracle) that can be executed repeatedly.
Returns a Single Value: Unlike stored procedures, which can perform actions and return multiple results (or none), a function must return a single value. This makes them suitable for use directly within SQL queries (e.g., in SELECT, WHERE, HAVING clauses).
Types:
Scalar Functions: Return a single data value (e.g., a number, a string, a date).
Table-Valued Functions (TVFs): Return a table. These are often used to encapsulate complex queries and provide a view-like interface.
Purpose:
Complex Calculations: Performing calculations that are too complex or repetitive for a standard SQL expression.
Data Transformation: Formatting data (e.g., converting dates to specific string formats, calculating age from a birthdate).
Business Logic: Encapsulating specific business rules that yield a single result.
Code Reusability: Avoiding redundant code by defining a common operation once.
![function](https://github.com/user-attachments/assets/acd3b7b8-0f31-4918-a9f9-73d42b9af42d)

Diagram Title: Patient Admission and Initial Assessment Process

Pools (Major Participants/Systems):

Patient
Front Desk/Admissions
Medical Staff (Doctor/Nurse)
Therapist/Counselor
System (IT)
Swimlanes (Roles within Pools):
Encapsulation and Organization: Packages allow you to bundle related PL/SQL code units (procedures and functions) and data structures (variables, constants) into a single, named unit. This improves code organization and readability.
Modularization: They promote modular programming by allowing you to define a clear interface (the package specification) and hide the implementation details (the package body). This means users only need to know how to call the procedures/functions in the specification, not how they work internally.
Information Hiding: The package body can contain private procedures, functions, and variables that are not exposed outside the package. This protects internal logic and data from unintended external access.
State Management (Package Variables): Package-level variables remain active for the duration of a session, allowing you to maintain state across multiple calls to procedures and functions within the same package during a user's session. This is useful for caching data or storing session-specific settings.
Dependency Management: If a package specification changes, dependent objects need to be recompiled. However, if only the package body changes, dependent objects do not need recompilation, which minimizes impact on the database application.
Overloading: Packages allow you to define multiple procedures or functions with the same name, as long as their parameters differ in number, type, or order. This provides flexibility and makes the code more intuitive to use.
Enhanced Performance: The entire package is loaded into memory when one of its procedures or functions is called for the first time, leading to faster subsequent calls within the same session.
Sources
![packages](https://github.com/user-attachments/assets/fdb24ac5-ddba-4cfd-9ea5-ff8d3276646f)

Within Front Desk/Admissions: Admissions Officer
Within Medical Staff: Nurse, Doctor
Within Therapist/Counselor: Counselor
Start Event:
![macrine pdb](https://github.com/user-attachments/assets/fbb1d86e-3278-427b-8924-cec5f555bb54)

Start Event: "Patient Arrives for Admission" (circle with single thin border)
Tasks (Activities - Rectangles with rounded corners):

Admissions Officer: Collect Demographic & Insurance Info
System interaction: Submits data to System.
System: Create Patient Record
Output: Generates Patient ID.
Admissions Officer: Verify Patient ID & Schedule Initial Medical Assessment
System interaction: Schedules appointment in System.
Medical Staff (Nurse): Conduct Vitals & Basic Health Screening
System interaction: Records data in System.
Medical Staff (Doctor): Perform Medical Assessment & Detox Needs Evaluation
System interaction: Records findings and initial recommendations in System.
System: Update Patient Medical Status
Therapist/Counselor: Conduct Addiction History & Psychological Assessment
System interaction: Records detailed assessment in System.
System: Update Patient Addiction Profile
Gateways (Decisions/Splits - Diamonds):

Exclusive Gateway (X) after "Perform Medical Assessment":
Path 1: Detox Required? -> Yes -> Connects to a Detox Pathway (another subprocess, not detailed here)
Path 2: Detox Required? -> No -> Connects to Conduct Addiction History & Psychological Assessment
End Event:

End Event: "Initial Assessments Complete" (circle with thick border)
Sequence Flows (Arrows):

Connect tasks, gateways, and events in chronological order.
Show messages between pools (e.g., from Patient to Front Desk, from System to Medical Staff for notifications).
Simplified Flow:
Patient Arrives -> [Admissions Officer] Collect Info -> [System] Create Record -> [Nurse] Vitals -> [Doctor] Medical Eval -> (Decision: Detox?) -> If No Detox -> [Counselor] Addiction Assessment -> Initial Assessments Complete.
![macrinee tables](https://github.com/user-attachments/assets/04ce34f2-b18f-4e07-9b53-25c0f5b648ac)

Slide 7: Logical Flow and Dependencies
The implementation of an integrated patient management system for drug addiction would involve the following logical flow and dependencies, focusing on a robust backend:

Database Schema Design:![UML](https://github.com/user-attachments/assets/40bd69ff-73d2-47d5-aeb0-cb96c6038e05)

          
Dependency: Detailed understanding of all data entities (Patients, Providers, Treatment Plans, Medications, Assessments, Appointments, Progress Notes, Relapses, etc.) and their relationships.
Activity: Design the relational database schema with appropriate tables, columns, data types, primary keys, foreign key constraints to enforce relationships and data integrity. Utilize normalization principles.
Backend Logic Development (e.g., PL/SQL Packages, API Services):
![The-BPMN-diagram](https://github.com/user-attachments/assets/400d739e-2cc5-4e60-ba68-4ebd9b242d98)

Dependency: Completed Database Schema.
Activity: Develop server-side logic to encapsulate business rules, data validation, and data access operations. This could involve:
Procedures: For data manipulation (inserting new patients, updating treatment plans, recording observations, deleting records).
Functions: For complex calculations (e.g., calculating treatment effectiveness scores, aggregating relapse data) and data retrieval.
Triggers: To enforce business rules automatically (e.g., audit logging, preventing invalid data entry).
API Endpoints: If using a multi-tiered architecture (e.g., a REST API layer), these would be developed to expose database functionalities to the frontend.
User Interface (UI) Development:

Dependency: Stable Backend Logic (Database and PL/SQL/API services).
Activity: Develop a user-friendly front-end application (e.g., web application using React/Angular, mobile app, or specialized healthcare EMR interface) that interacts with the backend. The UI would allow users to perform their tasks efficiently and intuitively.
Security and Access Control:
![alterd sesion](https://github.com/user-attachments/assets/45e921aa-2fb8-49d7-9cfe-e23273125197)
![aletr plaggable](https://github.com/user-attachments/assets/7735edfc-cf3b-47e8-9b6e-62c06515183d)

Dependency: Database Design and Backend Logic.
Activity: Implement robust security measures at the database level (role-based access control, encryption) and application level (authentication, authorization, session management) to control user access to specific data and functionalities based on their roles and ensure HIPAA/GDPR compliance.
Integration with External Systems (Optional but Recommended):

Dependency: Established APIs/data exchange protocols with external systems (e.g., lab systems, pharmacy systems, billing systems, public health registries).
Activity: Develop interfaces or connectors to exchange data with other healthcare systems to achieve a truly holistic view of patient care.
Testing and Validation:

Dependency: All previous development steps completed.
Activity: Thoroughly test all components of the system (database, backend logic, UI, integrations) to ensure they function correctly, meet all project requirements, are secure, and perform optimally. This includes unit testing, integration testing, system testing, and user acceptance testing (UAT).
Deployment and Training:

Dependency: System fully tested and validated.
Activity: Deploy the system to a production environment. Conduct comprehensive training for all target users to ensure smooth adoption and effective utilization of the new system.
