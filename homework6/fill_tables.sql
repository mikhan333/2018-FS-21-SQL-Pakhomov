use track_roads;

LOAD DATA INFILE '/var/lib/mysql-files/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/sessions.csv'
INTO TABLE sessions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/model.csv'
INTO TABLE models
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/cars.csv'
INTO TABLE cars
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/tracks.csv'
INTO TABLE tracks
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/sections.csv'
INTO TABLE sections
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/driveways.csv'
INTO TABLE driveways
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/sections_price.csv'
INTO TABLE sections_price
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';