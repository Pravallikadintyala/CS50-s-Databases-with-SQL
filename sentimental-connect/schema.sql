-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

-- Create the schools table
CREATE TABLE IF NOT EXISTS schools (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT CHECK(type IN ('Primary', 'Secondary', 'Higher Education')) NOT NULL,
    location TEXT,
    year_founded INTEGER
);

-- Create the companies table
CREATE TABLE IF NOT EXISTS companies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    industry TEXT CHECK(industry IN ('Technology', 'Education', 'Business')) NOT NULL,
    location TEXT
);

-- Create the user_connections table
CREATE TABLE IF NOT EXISTS user_connections (
    user_id INTEGER,
    connection_id INTEGER,
    PRIMARY KEY (user_id, connection_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (connection_id) REFERENCES users(id)
);

-- Create the user_schools table
CREATE TABLE IF NOT EXISTS user_schools (
    user_id INTEGER,
    school_id INTEGER,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (user_id, school_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (school_id) REFERENCES schools(id)
);

-- Create the user_companies table
CREATE TABLE IF NOT EXISTS user_companies (
    user_id INTEGER,
    company_id INTEGER,
    title TEXT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (user_id, company_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES companies(id)
);

-- Insert sample data
INSERT INTO users (first_name, last_name, username, password)
VALUES
('Claudine', 'Gay', 'claudine', 'password'),
('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO schools (name, type, location, year_founded)
VALUES ('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

INSERT INTO companies (name, industry, location)
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO user_schools (user_id, school_id, start_date, end_date)
VALUES
((SELECT id FROM users WHERE username='claudine'), (SELECT id FROM schools WHERE name='Harvard University'), '1993-01-01', '1998-12-31');

INSERT INTO user_companies (user_id, company_id, title, start_date, end_date)
VALUES
((SELECT id FROM users WHERE username='reid'), (SELECT id FROM companies WHERE name='LinkedIn'), 'CEO and Chairman', '2003-01-01', '2007-02-01');
