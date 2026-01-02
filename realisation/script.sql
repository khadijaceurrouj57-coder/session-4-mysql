-- ================================
-- Base de données : blog_solicode
-- ================================

CREATE DATABASE IF NOT EXISTS blog_solicode;
USE blog_solicode;

-- ================================
-- Table users
-- ================================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================
-- Table categories
-- ================================
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- ================================
-- Table posts
-- ================================
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (category_id) REFERENCES categories(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ================================
-- Table comments
-- ================================
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
