
CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE Check_Ins (
    "id" INTEGER,
    "CheckIn_datetime" DATETIME NOT NULL,
    "flight_name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE Airlines (
    "airline_name" TEXT,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
);

CREATE TABLE Flights (
    "flight_number" INTEGER,
    "airline_operating_the_flight" TEXT,
    "departing_airport_code" TEXT,
    "destination_airport_code" TEXT,
    "Expected_departure_date" DATETIME NOT NULL,
    "Expected_arrival_date" DATETIME NOT NULL,
    PRIMARY KEY("flight_number"),
    FOREIGN KEY("Expected_arrival_date") REFERENCES "Check_Ins"("CheckIn_datetime")
);
