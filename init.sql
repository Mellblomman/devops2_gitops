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

CREATE OR REPLACE VIEW user_bookings_view AS
SELECT bi.*, c.price
FROM bookinginformation bi
JOIN court c ON bi.activity = c.activity;

INSERT INTO inloggningsuppgifter (email, password) VALUES ('lukas@hotmail.com', 'abc123');
INSERT INTO court (activity, price) VALUES ('Tennis', '300');