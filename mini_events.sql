CREATE DATABASE mini_events;
USE mini_events;

CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE Attendees (
    attendee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE RSVPs (
    rsvp_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    attendee_id INT NOT NULL,
    status ENUM('Going','Not Going') DEFAULT 'Going',
    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (attendee_id) REFERENCES Attendees(attendee_id)
);

INSERT INTO Events (name, event_date, location) VALUES
('Coding Workshop', '2026-01-15', 'Room 101'),
('Art Expo', '2026-01-20', 'Main Hall'),
('Music Night', '2026-01-25', 'Auditorium');

INSERT INTO Attendees (name, email) VALUES
('Alice', 'alice@email.com'),
('Bob', 'bob@email.com'),
('Charlie', 'charlie@email.com');

INSERT INTO RSVPs (event_id, attendee_id, status) VALUES
(1, 1, 'Going'),
(2, 2, 'Going'),
(3, 3, 'Not Going');
