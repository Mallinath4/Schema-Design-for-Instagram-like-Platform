create database Instagram;
use Instagram;
-- Create User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Email VARCHAR(100),
    Full_Name VARCHAR(100),
    Bio TEXT,
    Registration_Date DATE
);

-- Create Post Table
CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    UserID INT,
    Caption TEXT,
    Image_URL VARCHAR(255),
    Location VARCHAR(100),
    Post_Date DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Comment Table
CREATE TABLE Comment (
    CommentID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    Text TEXT,
    Comment_Date DATE,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Like Table
CREATE TABLE Like1 (
    LikeID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    Like_Date DATE,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Follower Table
CREATE TABLE Follower (
    FollowerID INT PRIMARY KEY,
    FollowingUserID INT,
    FollowerUserID INT,
    Follow_Date DATE,
    FOREIGN KEY (FollowingUserID) REFERENCES User(UserID),
    FOREIGN KEY (FollowerUserID) REFERENCES User(UserID)
);

-- Create Hashtag Table
CREATE TABLE Hashtag (
    HashtagID INT PRIMARY KEY,
    Tag VARCHAR(50)
);

-- Create PostHashtag Table
CREATE TABLE PostHashtag (
    PostHashtagID INT PRIMARY KEY,
    PostID INT,
    HashtagID INT,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (HashtagID) REFERENCES Hashtag(HashtagID)
);

SHOW VARIABLES LIKE 'secure_file_priv';


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\users.csv' 
INTO TABLE User 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\posts.csv' 
INTO TABLE Post 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\comments.csv' 
INTO TABLE comment 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\likes.csv' 
INTO TABLE like1 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\followers.csv' 
INTO TABLE Follower 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\hashtags.csv' 
INTO TABLE Hashtag 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\post_hashtags.csv' 
INTO TABLE PostHashtag
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

select * from user;
select * from post;
select * from comment;
select * from like1;
select * from follower;
select * from hashtag;
select * from posthashtag;