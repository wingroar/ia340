-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS professor
(
    p_email VARCHAR(50) NOT NULL,
    p_name VARCHAR(50) NOT NULL,
    office VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY(p_email)
);

CREATE TABLE IF NOT EXISTS student
(
    s_email VARCHAR(50) NOT NULL,
    s_name VARCHAR(50) NOT NULL,
    major VARCHAR(10) NOT NULL,
    PRIMARY KEY(s_email)
);

CREATE TABLE IF NOT EXISTS course
(
    c_number VARCHAR(20) NOT NULL,
    c_name VARCHAR(50) NOT NULL,
    room VARCHAR(10) NOT NULL,
    p_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(c_number)
);

CREATE TABLE IF NOT EXISTS enroll
(
    c_number VARCHAR(20) NOT NULL,
    s_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(c_number, s_email)
);


-- Create FKs
ALTER TABLE course
    ADD    FOREIGN KEY (p_email)
    REFERENCES professor(p_email)
    MATCH SIMPLE
;
    
ALTER TABLE enroll
    ADD    FOREIGN KEY (c_number)
    REFERENCES course(c_number)
    MATCH SIMPLE
;
    
ALTER TABLE enroll
    ADD    FOREIGN KEY (s_email)
    REFERENCES student(s_email)
    MATCH SIMPLE
;
    

-- Create Indexes

