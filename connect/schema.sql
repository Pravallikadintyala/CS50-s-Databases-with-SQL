CREATE TABLE users(
    "UserID" INTEGER NOT NULL,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" NOT NULL

);

CREATE TABLE Schools_and_Universities (
    "school_name" TEXT,
    "school_type" TEXT,
    "school_location" TEXT,
    "school_founded_YEAR" INTEGER
);

CREATE TABLE companies (
    "company_name" TEXT,
    "company_industry" TEXT,
    "company_location" TEXT
);

CREATE TABLE UserConnections (
    ConnectionID INT PRIMARY KEY,
    UserID1 INT NOT NULL,
    UserID2 INT NOT NULL,
    ConnectionDate DATE,
    FOREIGN KEY (UserID1) REFERENCES Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES Users(UserID)
);

CREATE TABLE Affiliations (
    AffiliationID INT PRIMARY KEY,
    UserID INT NOT NULL,
    SchoolID INT NOT NULL,
    StartDate DATE,
    EndDate DATE,
    DegreeType VARCHAR(10),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);

CREATE TABLE EmploymentHistory (
    EmploymentID INT PRIMARY KEY,
    UserID INT NOT NULL,
    CompanyID INT NOT NULL,
    StartDate DATE,
    EndDate DATE,
    JobTitle VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);



