CREATE TABLE IF NOT EXISTS Address
(
	address_id VARCHAR(20) PRIMARY KEY,
	street VARCHAR(200),
	city VARCHAR(100),
	"state" VARCHAR(100),
	country VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS School
(
	school_id VARCHAR(20) PRIMARY KEY,
	school_name VARCHAR(100),
	education_board VARCHAR(80),
	address_id VARCHAR(20),
	CONSTRAINT fk_sch_add FOREIGN KEY(address_id) REFERENCES Address(address_id)
);

CREATE TABLE Staff
(
	staff_id VARCHAR(20),
	stafff_type VARCHAR(30),
	school_id VARCHAR(20),
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	age INT,
	dob DATE,
	gender VARCHAR(10) CHECK (gender IN ('M', 'F')),
	join_date DATE,
	address_id VARCHAR(20),
	CONSTRAINT pk_stf PRIMARY KEY(staff_id),
	CONSTRAINT fk_stf_schl FOREIGN KEY(school_id) REFERENCES School(school_id),
	CONSTRAINT fk_stf_addr FOREIGN KEY(address_id) REFERENCES Address(address_id)
);

INSERT INTO Address VALUES
('ADR1001', '44940 Bluestem circle', 'Baton Rouge', 'Louisiana', 'United States' );

INSERT INTO School VALUES
('SCHL1001', 'Noble School', 'CBSE', 'ADR1001');

INSERT INTO Staff (staff_id, staff_type, school_id, first_name, last_name, age, dob, gender, join_date, address_id) VALUES
('stf2004', 'non-teaching', 'schl1001', 'shamala', 'devi', '56', TO_DATE('15/07/2023', 'DD/MM/YYYY'), 'F', TO_DATE('05/05/2015','DD/MM/YYYY'))

SELECT * FROM Address;
SELECT * FROM School;
SELECT * FROM Staff;