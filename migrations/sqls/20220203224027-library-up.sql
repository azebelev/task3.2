CREATE TABLE IF NOT EXISTS books
(id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
img VARCHAR(255) NOT NULL,
year INT NOT NULL,
size INT NOT NULL,
descr  VARCHAR(255) NOT NULL,
clicks INT NOT NULL DEFAULT 0,
visits INT NOT NULL DEFAULT 0,
deleted BOOLEAN DEFAULT false,
PRIMARY KEY (id))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS authors 
(id INT NOT NULL AUTO_INCREMENT,
author VARCHAR(255) NOT NULL UNIQUE,
PRIMARY KEY (id),
CHECK (CHAR_LENGTH(author) > 2))
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS books_authors 
(id INT NOT NULL AUTO_INCREMENT,
book_id INT NOT NULL,
author_id INT NOT NULL,
FOREIGN KEY (book_id)
REFERENCES books(id) ON DELETE CASCADE,
FOREIGN KEY (author_id)
REFERENCES authors(id) ON DELETE CASCADE,
PRIMARY KEY (id))
ENGINE=InnoDB;







   
