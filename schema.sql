-- Database schema for running the app locally.
-- Reconstructed from the queries in src/main/java/com/buildathon/dao after the event
-- (the original database was created by hand during the 48 hours).

CREATE DATABASE IF NOT EXISTS buildathon_db;
USE buildathon_db;

CREATE TABLE users (
    user_id   INT AUTO_INCREMENT PRIMARY KEY,
    username  VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE community_board (
    post_id    INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT,
    title      VARCHAR(200) NOT NULL,
    content    TEXT,
    image_url  VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE study_buddy_board (
    buddy_id           INT AUTO_INCREMENT PRIMARY KEY,
    user_id            INT,
    title              VARCHAR(200) NOT NULL,
    subject            VARCHAR(100),
    preferred_language VARCHAR(50),
    content            TEXT,
    created_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- post_id refers to community_board or study_buddy_board depending on board_type
CREATE TABLE comments (
    comment_id   INT AUTO_INCREMENT PRIMARY KEY,
    user_id      INT NOT NULL,
    post_id      INT NOT NULL,
    board_type   VARCHAR(20) NOT NULL,
    comment_text TEXT NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Login is not implemented yet; the app posts as user 1
INSERT INTO users (username) VALUES ('demo_user');
