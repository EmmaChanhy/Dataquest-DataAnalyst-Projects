#Open db/create new db
sqlite3 chinook.db
sqlite3 new_databese.db

#Enable column header
.headers on

#Seperate headers into column
.mode column

#Displays a list of all tables and views in the current database
.tables

#Clear
.shell clear

#View schema
.schema

#Create table & define keys
CREATE TABLE wishlist (
    wishlist_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    name TEXT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id));

#Compound primary key
CREATE TABLE wishlist_track (
    wishlist_id INTEGER,
    track_id INTEGER,
    PRIMARY KEY (wishlist_id, track_id),
    FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id),
    FOREIGN KEY (track_id) REFERENCES track(track_id));

#Insert data
INSERT INTO wishlist
   ...> VALUES
   ...> (1, 34, "Joao's awesome wishlist"),
   ...> (2, 18, "Amy loves pop");

INSERT INTO wishlist_track
   ...> VALUES
   ...> (1, 1158),
   ...> (1, 2646),
   ...> (, 1990),
   ...> (1, 1990),
   ...> (2, 3272),
   ...> (2, 3470);





