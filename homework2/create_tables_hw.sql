use track_hw;

CREATE TABLE users(
	user_id INT NOT NULL AUTO_INCREMENT,
    login VARCHAR(45) NOT NULL,
    reg_dttm TIMESTAMP,
    PRIMARY KEY(user_id)
);

CREATE TABLE payments(
	payment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    payment_sum DOUBLE,
    payment_dttm TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE sessions(
	session_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    begin_dttm TIMESTAMP,
    end_dttm TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);