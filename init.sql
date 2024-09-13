CREATE TABLE IF NOT EXISTS inloggningsuppgifter (
    email TEXT PRIMARY KEY,
    password TEXT NOT NULL,
    phone VARCHAR(10),
    admin boolean DEFAULT 'FALSE'
);

CREATE TABLE IF NOT EXISTS court (
    activity TEXT PRIMARY KEY,
    price NUMERIC
);

CREATE TABLE IF NOT EXISTS bookinginformation (
    booking_id INT NOT NULL,
    activity VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY(activity, date, time)
);

CREATE TABLE contact_messages (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    message TEXT NOT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE VIEW user_bookings_view AS
SELECT bi.*, c.price
FROM bookinginformation bi
JOIN court c ON bi.activity = c.activity;

INSERT INTO inloggningsuppgifter (email, password, phone, admin) VALUES ('admin@gmail.com', 'abc123', '1234567890', 'TRUE');
INSERT INTO court (activity, price) VALUES ('Tennis', '300');
INSERT INTO contact_messages (email, phone, message) VALUES ('test@example.com', '1234567890', 'Do we have any A-ARON IN THE CLASS?');

/* För att logga in på databasen:
1. docker exec -it devops2-gitops-db-1 bash
2. psql -U postgres -d postgres
3. SELECT * FROM contact_messages;

Se alla tabeller med \dt i psql.

Nu kommer du se alla meddelanden som kunder skriver!
*/