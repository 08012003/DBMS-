create database HospitalManagemen
create table Patient
	(
		email varchar(50) primary key,
        password varchar(30) not null,
        name varchar(50) not null,
        address varchar(60) not null,
        gender varchar(20) not null 
	);
    
INSERT INTO Patient (email, password, name, address, gender)
VALUES
  ('patient1@gmail.com', 'pass1234', 'Rajesh Kumar', '123 Main St, Mumbai, Maharashtra, India', 'Male'),
  ('patient2@gmail.com', 'pass5678', 'Sneha Sharma', '456 Elm St, Delhi, Delhi, India', 'Female'),
  ('patient3@gmail.com', 'passabcd', 'Amit Patel', '789 Oak St, Bangalore, Karnataka, India', 'Male'),
  ('patient4@gmail.com', 'passwxyz', 'Priya Singh', '321 Pine St, Kolkata, West Bengal, India', 'Female'),
  ('patient5@gmail.com', 'pass1234', 'Nikhil Gupta', '654 Maple St, Chennai, Tamil Nadu, India', 'Male'),
  ('patient6@gmail.com', 'pass5678', 'Divya Verma', '987 Cedar St, Hyderabad, Telangana, India', 'Female'),
  ('patient7@gmail.com', 'passabcd', 'Vikram Sharma', '159 Ash St, Pune, Maharashtra, India', 'Male'),
  ('patient8@gmail.com', 'passwxyz', 'Anjali Singh', '852 Birch St, Jaipur, Rajasthan, India', 'Female'),
  ('patient9@gmail.com', 'pass1234', 'Rahul Verma', '753 Walnut St, Ahmedabad, Gujarat, India', 'Male'),
  ('patient10@gmail.com', 'pass5678', 'Pooja Gupta', '369 Pine St, Lucknow, Uttar Pradesh, India', 'Female');
    
select * from patient;

CREATE TABLE MedicalHistory (
  id INT PRIMARY KEY,
  date DATE NOT NULL,
  `condition` VARCHAR(100) NOT NULL,
  surgeries VARCHAR(100) NOT NULL,
  medication VARCHAR(100) NOT NULL
);
 
INSERT INTO MedicalHistory (id, date, `condition`, surgeries, medication) VALUES
  (1, '2023-01-01', 'Fever', 'Appendectomy', 'Paracetamol'),
  (2, '2022-12-15', 'Diabetes', 'None', 'Insulin'),
  (3, '2023-03-10', 'Hypertension', 'Coronary bypass surgery', 'Amlodipine'),
  (4, '2022-11-20', 'Migraine', 'None', 'Sumatriptan'),
  (5, '2023-02-05', 'Asthma', 'None', 'Inhaler - Salbutamol'),
  (6, '2023-04-18', 'Gastritis', 'None', 'Omeprazole'),
  (7, '2022-10-05', 'Arthritis', 'Knee replacement surgery', 'Diclofenac'),
  (8, '2023-05-12', 'Thyroid disorder', 'None', 'Levothyroxine'),
  (9, '2022-09-25', 'Allergies', 'None', 'Antihistamine - Cetirizine'),
  (10, '2023-06-01', 'Depression', 'None', 'Sertraline');

select * from MedicalHistory;

create table doctor 
	(
		email varchar (50) primary key,
        password varchar(30) not null,
        name varchar(30) not null,
        gender varchar(20) not null
	);

INSERT INTO Doctor (email, password, name, gender) VALUES
  ('doctor1@gmail.com', 'pass1234', 'Dr. Rajesh Kumar', 'Male'),
  ('doctor2@gmail.com', 'pass5678', 'Dr. Sneha Sharma', 'Female'),
  ('doctor3@gmail.com', 'passabcd', 'Dr. Amit Patel', 'Male'),
  ('doctor4@gmail.com', 'passwxyz', 'Dr. Priya Singh', 'Female'),
  ('doctor5@gmail.com', 'pass1234', 'Dr. Nikhil Gupta', 'Male'),
  ('doctor6@gmail.com', 'pass5678', 'Dr. Divya Verma', 'Female'),
  ('doctor7@gmail.com', 'passabcd', 'Dr. Vikram Sharma', 'Male'),
  ('doctor8@gmail.com', 'passwxyz', 'Dr. Anjali Singh', 'Female'),
  ('doctor9@gmail.com', 'pass1234', 'Dr. Rahul Verma', 'Male'),
  ('doctor10@gmail.com', 'pass5678', 'Dr. Pooja Gupta', 'Female');

select * from MedicalHistory;

create table appointment 
	(
		id int primary key,
        date date not null,
        starttime time not null,
        endtime time not null,
        status varchar(15) not null
	);

INSERT INTO Appointment (id, date, starttime, endtime, status) VALUES
  (1, '2023-06-15', '10:00:00', '11:00:00', 'Scheduled'),
  (2, '2023-06-16', '14:30:00', '15:30:00', 'Scheduled'),
  (3, '2023-06-18', '11:30:00', '12:30:00', 'Cancelled'),
  (4, '2023-06-20', '16:00:00', '17:00:00', 'Scheduled'),
  (5, '2023-06-22', '09:00:00', '10:00:00', 'Completed'),
  (6, '2023-06-24', '13:30:00', '14:30:00', 'Scheduled'),
  (7, '2023-06-26', '15:00:00', '16:00:00', 'Scheduled'),
  (8, '2023-06-28', '10:30:00', '11:30:00', 'Scheduled'),
  (9, '2023-06-30', '12:00:00', '13:00:00', 'Scheduled'),
  (10, '2023-07-02', '14:00:00', '15:00:00', 'Scheduled');

select * from appointment;

create table PatientAttendAppointments
	(
		patient varchar(50) not null,
        appt int not null,
        concerns varchar(40) NOT null,
        symptoms varchar(40) not null,
        foreign key(patient) references patient (email) on delete cascade,
        foreign key(appt) references appointment(id) on delete cascade,
        primary key (patient, appt)
	);

INSERT INTO PatientAttendAppointments (patient, appt, concerns, symptoms) VALUES
  ('patient1@gmail.com', 1, 'Headache', 'Dizziness'),
  ('patient2@gmail.com', 2, 'Fever', 'Cough'),
  ('patient3@gmail.com', 3, 'Stomach pain', 'Nausea'),
  ('patient4@gmail.com', 4, 'Backache', 'Muscle stiffness'),
  ('patient5@gmail.com', 5, 'Fatigue', 'Loss of appetite'),
  ('patient6@gmail.com', 6, 'Chest pain', 'Shortness of breath'),
  ('patient7@gmail.com', 7, 'Joint pain', 'Swelling'),
  ('patient8@gmail.com', 8, 'Allergic reaction', 'Itching'),
  ('patient9@gmail.com', 9, 'Difficulty sleeping', 'Anxiety'),
  ('patient10@gmail.com', 10, 'Sore throat', 'Hoarseness');

select * from PatientAttendAppointments;
        
create table schedule 
	( 
		id int not null,
        starttime time not null,
        endtime time not null,
        breaktime time not null,
        day varchar(20) not null,
        primary key(id, starttime, endtime , breaktime,day)
	);
	
INSERT INTO schedule (id, starttime, endtime, breaktime, day) VALUES
  (1, '09:00:00', '17:00:00', '13:00:00', 'Monday'),
  (2, '09:30:00', '18:30:00', '13:30:00', 'Tuesday'),
  (3, '10:00:00', '19:00:00', '14:00:00', 'Wednesday'),
  (4, '10:30:00', '19:30:00', '14:30:00', 'Thursday'),
  (5, '11:00:00', '20:00:00', '15:00:00', 'Friday'),
  (6, '12:00:00', '21:00:00', '16:00:00', 'Saturday'),
  (7, '12:30:00', '21:30:00', '16:30:00', 'Sunday'),
  (8, '13:00:00', '22:00:00', '17:00:00', 'Monday'),
  (9, '13:30:00', '22:30:00', '17:30:00', 'Tuesday'),
  (10, '14:00:00', '23:00:00', '18:00:00', 'Wednesday');

select * from schedule;
        
create table PatientFileHistory
	(
		patient varchacustomerIDnamer(50) not null,
        history int not null,
        foreign key (history) references medicalhistory(id) on delete cascade,
        primary key(history)
	);

INSERT INTO PatientFileHistory (patient, history) VALUES
  ('patient1@gmail.com', 1),
  ('patient2@gmail.com', 2),
  ('patient3@gmail.com', 3)book,
  ('patient4@gmail.com', 4),
  ('patient5@gmail.com', 5),
  ('patient6@gmail.com', 6),
  ('patient7@gmail.com', 7),
  ('patient8@gmail.com', 8),
  ('patient9@gmail.com', 9),
  ('patient10@gmail.com', 10);

select * from PatientFileHistory;
        
        
create table Diagnose
	(
		appt int not null,
        doctor varchar(50) not null,
        diagnose varchar(40) not null,
        prescription varchar(50) not null,
        foreign key(doctor) references doctor(email) on delete cascade,
        primary key(appt,doctor)
	);

INSERT INTO Diagnose (appt, doctor, diagnose, prescription) VALUES
  (1, 'doctor1@gmail.com', 'Fever', 'Paracetamol'),
  (2, 'doctor2@gmail.com', 'Headache', 'Ibuprofen'),
  (3, 'doctor3@gmail.com', 'Common Cold', 'Antihistamines'),
  (4, 'doctor4@gmail.com', 'Stomachache', 'Antacids'),
  (5, 'doctor5@gmail.com', 'Allergies', 'Nasal Spray'),
  (6, 'doctor6@gmail.com', 'Sinusitis', 'Antibiotics'),
  (7, 'doctor7@gmail.com', 'Back Pain', 'Muscle Relaxants'),
  (8, 'doctor8@gmail.com', 'High Blood Pressure', 'ACE inhibitors'),
  (9, 'doctor9@gmail.com', 'Diabetes', 'Insulin'),
  (10, 'doctor10@gmail.com', 'Anxiety', 'Selective Serotonin Reuptake Inhibitors');

select * from Diagnose;

        
create table DocsHaveSchedule
	(
		sched int not null,
        doctor varchar(50) not null,
        foreign key (doctor) references doctor(email) on delete cascade,
        primary key (sched, doctor)
	);
    
INSERT INTO DocsHaveSchedule (sched, doctor) VALUES
  (1, 'doctor1@gmail.com'),
  (2, 'doctor2@gmail.com'),
  (3, 'doctor3@gmail.com'),
  (4, 'doctor4@gmail.com'),
  (5, 'doctor5@gmail.com'),
  (6, 'doctor6@gmail.com'),
  (7, 'doctor7@gmail.com'),
  (8, 'doctor8@gmail.com'),
  (9, 'doctor9@gmail.com'),
  (10, 'doctor10@gmail.com');

        
select * from DocsHaveSchedule;

create table DoctorViewHistory
	(
		history int not null,
        doctor varchar(50) not null,
        foreign key(doctor) references doctor(email) on delete cascade,
        foreign key(history) references MedicalHistory(id) on delete cascade,
        primary key(history, doctor)
	);

INSERT INTO DoctorViewHistory (history, doctor) VALUES
  (1, 'doctor1@gmail.com'),
  (2, 'doctor2@gmail.com'),
  (3, 'doctor3@gmail.com'),
  (4, 'doctor4@gmail.com'),
  (5, 'doctor5@gmail.com'),
  (6, 'doctor6@gmail.com'),
  (7, 'doctor7@gmail.com'),
  (8, 'doctor8@gmail.com'),
  (9, 'doctor9@gmail.com'),
  (10, 'doctor10@gmail.com');

select * from DoctorViewHistory;

