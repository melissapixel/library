CREATE DATABASE IF NOT EXISTS task13;
USE task13;

-- Авторы
CREATE TABLE IF NOT EXISTS authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    birth_year INT,
    nationality VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Издатели
CREATE TABLE IF NOT EXISTS publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100),
    UNIQUE KEY uq_publisher_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Жанры
CREATE TABLE IF NOT EXISTS genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    UNIQUE KEY uq_genre_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Книги
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(512) NOT NULL,
    isbn VARCHAR(20),
    published_year INT,
    publisher_id INT NOT NULL,
    genre_id INT,
    pages INT,
    language VARCHAR(50),
    description TEXT,
    UNIQUE KEY uq_book_unique (title, publisher_id, published_year),
    KEY idx_publisher (publisher_id),
    KEY idx_genre (genre_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Связь книг и авторов (многие-ко-многим)
CREATE TABLE IF NOT EXISTS book_authors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Читатели
CREATE TABLE IF NOT EXISTS borrowers (
    borrower_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(50),
    address TEXT,
    joined_date DATE NOT NULL,
    UNIQUE KEY uq_borrower_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Выдачи
CREATE TABLE IF NOT EXISTS loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    borrower_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status ENUM('requested','on_loan','returned','overdue') NOT NULL DEFAULT 'requested',
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id) ON UPDATE CASCADE ON DELETE CASCADE,
    KEY idx_loan_date (loan_date),
    KEY idx_due_date (due_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Ключевые слова для книг (многие-ко-многим, простая реализация)
CREATE TABLE IF NOT EXISTS keywords (
    keyword_id INT AUTO_INCREMENT PRIMARY KEY,
    word VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS book_keywords (
    book_id INT NOT NULL,
    keyword_id INT NOT NULL,
    PRIMARY KEY (book_id, keyword_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (keyword_id) REFERENCES keywords(keyword_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- История изменений статусов выдач (опционально)
CREATE TABLE IF NOT EXISTS loan_status_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT NOT NULL,
    old_status ENUM('requested','on_loan','returned','overdue') NOT NULL,
    new_status ENUM('requested','on_loan','returned','overdue') NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS admins (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    role ENUM('admin', 'moderator', 'viewer') DEFAULT 'viewer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);