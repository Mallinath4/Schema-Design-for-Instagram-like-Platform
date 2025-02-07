# Instagram-like Platform Schema Design

This project involves designing a schema for a platform similar to Instagram. The schema includes tables for users, posts, comments, likes, followers, hashtags, and post-hashtag associations. The goal is to create a scalable and efficient data model that supports user interactions, content sharing, and discovery.

---

## **Table of Contents**
1. [Project Overview](#project-overview)
2. [Schema Design](#schema-design)
3. [Database Setup](#database-setup)
4. [Data Generation](#data-generation)
5. [ER Diagram](#er-diagram)
6. [Usage](#usage)
7. [Contributing](#contributing)
8. [License](#license)

---

## **Project Overview**
The project focuses on designing a database schema for an Instagram-like platform. The schema supports the following features:
- User profiles
- Posts (photos, videos, captions, locations)
- Comments and likes on posts
- Follower relationships
- Hashtags for content discovery

---

## **Schema Design**
The schema consists of the following tables:

### **1. User Table**
- `UserID` (Primary Key)
- `Username`
- `Email`
- `Full_Name`
- `Bio`
- `Registration_Date`

### **2. Post Table**
- `PostID` (Primary Key)
- `UserID` (Foreign Key)
- `Caption`
- `Image_URL`
- `Location`
- `Post_Date`

### **3. Comment Table**
- `CommentID` (Primary Key)
- `PostID` (Foreign Key)
- `UserID` (Foreign Key)
- `Text`
- `Comment_Date`

### **4. Like Table**
- `LikeID` (Primary Key)
- `PostID` (Foreign Key)
- `UserID` (Foreign Key)
- `Like_Date`

### **5. Follower Table**
- `FollowerID` (Primary Key)
- `FollowingUserID` (Foreign Key)
- `FollowerUserID` (Foreign Key)
- `Follow_Date`

### **6. Hashtag Table**
- `HashtagID` (Primary Key)
- `Tag`

### **7. PostHashtag Table**
- `PostHashtagID` (Primary Key)
- `PostID` (Foreign Key)
- `HashtagID` (Foreign Key)

---

## **Database Setup**
To set up the database, follow these steps:

1. **Install MySQL** (or any other relational database like PostgreSQL or SQLite).
2. **Create a Database**:
   ```sql
   CREATE DATABASE instagram;
   USE instagram;

3. ** Create a Tables**:
4. ** Create User Table**:
   ``` sql
    CREATE TABLE User (
        UserID INT PRIMARY KEY,
        Username VARCHAR(50),
        Email VARCHAR(100),
        Full_Name VARCHAR(100),
        Bio TEXT,
        Registration_Date DATE
    );
   ```
5. ** Create Post Table**:
   ```sql
    CREATE TABLE Post (
        PostID INT PRIMARY KEY,
        UserID INT,
        Caption TEXT,
        Image_URL VARCHAR(255),
        Location VARCHAR(100),
        Post_Date DATE,
        FOREIGN KEY (UserID) REFERENCES User(UserID)
    );
    ```
6. ** Create Comment Table**:
   ```sql
    CREATE TABLE Comment (
        CommentID INT PRIMARY KEY,
        PostID INT,
        UserID INT,
        Text TEXT,
        Comment_Date DATE,
        FOREIGN KEY (PostID) REFERENCES Post(PostID),
        FOREIGN KEY (UserID) REFERENCES User(UserID)
    );
    ```
7. ** Create Likes Table**:
   ```sql
    CREATE TABLE Likes (
        LikeID INT PRIMARY KEY,
        PostID INT,
        UserID INT,
        Like_Date DATE,
        FOREIGN KEY (PostID) REFERENCES Post(PostID),
        FOREIGN KEY (UserID) REFERENCES User(UserID)
    );
    ```
8. ** Create Follower Table**:
   ```sql
    CREATE TABLE Follower (
        FollowerID INT PRIMARY KEY,
        FollowingUserID INT,
        FollowerUserID INT,
        Follow_Date DATE,
        FOREIGN KEY (FollowingUserID) REFERENCES User(UserID),
        FOREIGN KEY (FollowerUserID) REFERENCES User(UserID)
    );
    ```
9. ** Create Hashtag Table**:
   ```sql
    CREATE TABLE Hashtag (
        HashtagID INT PRIMARY KEY,
        Tag VARCHAR(50)
    );
    ```
   
10. ** Create PostHashtag Table**:
  ```sql
    CREATE TABLE PostHashtag (
        PostHashtagID INT PRIMARY KEY,
        PostID INT,
        HashtagID INT,
        FOREIGN KEY (PostID) REFERENCES Post(PostID),
        FOREIGN KEY (HashtagID) REFERENCES Hashtag(HashtagID)
    );
  ```
**Import Data into Database**:
**Use the following command to import CSV files into the database**:
```sql
LOAD DATA INFILE 'path/to/users.csv'
INTO TABLE User
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```
**Query the Database**:
```sql
SELECT * FROM Users
SELECT * FROM Post
SELECT * FROM Comment
SELECT * FROM likes
SELECT * FROM follower
SELECT * FROM Hashtag
SELECT * FROM PostHashtag
```
