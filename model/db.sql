-- Create Database
CREATE DATABASE IF NOT EXISTS mp0487_firalia;
USE mp0487_firalia;

-- Table: users
CREATE TABLE IF NOT EXISTS users (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    USER VARCHAR(100) NOT NULL UNIQUE,
    NAME VARCHAR(100) NOT NULL,
    LASTNAME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL UNIQUE,
    PASSWORD VARCHAR(255) NOT NULL,
    ROL INT NOT NULL COMMENT '1=Admin, 2=Vendor, 3=User',
    USER_IMAGE VARCHAR(255) NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: eventos
CREATE TABLE IF NOT EXISTS eventos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(255) NOT NULL UNIQUE,
    MAIN_IMAGE_PATH VARCHAR(255) NOT NULL,
    TEXT1 LONGTEXT NOT NULL,
    IMAGE_TEXT_PATH VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: fechas_eventos
CREATE TABLE IF NOT EXISTS fechas_eventos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NUM_DIA INT NOT NULL,
    MES VARCHAR(3) NOT NULL,
    NOMBRE_DIA VARCHAR(20) NOT NULL,
    HORA INT NOT NULL,
    MINUTO INT NOT NULL,
    CIUDAD VARCHAR(100) NOT NULL,
    LOCALIZACION VARCHAR(255) NOT NULL,
    ID_EVENTO INT NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_EVENTO) REFERENCES eventos(ID) ON DELETE CASCADE
);

-- Table: galeria_eventos
CREATE TABLE IF NOT EXISTS galeria_eventos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    VIDEO VARCHAR(500) NOT NULL,
    ID_EVENTO INT NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_EVENTO) REFERENCES eventos(ID) ON DELETE CASCADE
);

-- ====================================
-- INSERT SAMPLE DATA - 5 RECORDS PER TABLE
-- ====================================

-- Insert 5 users
INSERT INTO users (USER, NAME, LASTNAME, EMAIL, PASSWORD, ROL, USER_IMAGE) VALUES
('admin_user', 'Carlos', 'García', 'admin@firalia.com', '$2y$10$NXqE6KhjKVv8T7aUKXwZV.xbYEF8J5p0.KJ7EYkPcE5L3B9P5g8N2', 1, 'images/admin.jpg'),
('vendor_juan', 'Juan', 'López', 'juan@firalia.com', '$2y$10$NXqE6KhjKVv8T7aUKXwZV.xbYEF8J5p0.KJ7EYkPcE5L3B9P5g8N2', 2, 'images/juan.jpg'),
('user_maria', 'María', 'Rodríguez', 'maria@firalia.com', '$2y$10$NXqE6KhjKVv8T7aUKXwZV.xbYEF8J5p0.KJ7EYkPcE5L3B9P5g8N2', 3, 'images/maria.jpg'),
('vendor_pedro', 'Pedro', 'Martínez', 'pedro@firalia.com', '$2y$10$NXqE6KhjKVv8T7aUKXwZV.xbYEF8J5p0.KJ7EYkPcE5L3B9P5g8N2', 2, NULL),
('user_laura', 'Laura', 'Sánchez', 'laura@firalia.com', '$2y$10$NXqE6KhjKVv8T7aUKXwZV.xbYEF8J5p0.KJ7EYkPcE5L3B9P5g8N2', 3, 'images/laura.jpg');

-- Insert 5 eventos
INSERT INTO eventos (NOMBRE, MAIN_IMAGE_PATH, TEXT1, IMAGE_TEXT_PATH) VALUES
('BLACKPINK', 'events/BLACKPINK/main.jpg', 'BLACKPINK is a South Korean girl group known for their powerful performances and global fanbase. Experience the energy and passion of K-pop at its finest!', 'events/BLACKPINK/poster.jpg'),
('POSTMALONE', 'events/POSTMALONE/main.jpg', 'Post Malone brings his unique blend of hip-hop, rock, and pop to the stage. A must-see performance featuring hits from his entire catalog!', 'events/POSTMALONE/poster.jpg'),
('SABRINA CARPENTER', 'events/SABRINA CARPENTER/main.jpg', 'Sabrina Carpenter delivers an unforgettable concert experience with her incredible vocals and stage presence. Don\'t miss this rising star!', 'events/SABRINA CARPENTER/poster.jpg'),
('SALO DEL MANGA', 'events/SALO DEL MANGA/main.jpg', 'Celebrate anime and manga culture at Salón del Manga! Meet artists, enjoy cosplay, and immerse yourself in the world of Japanese animation and comics!', 'events/SALO DEL MANGA/poster.jpg'),
('METALLICA', 'events/METALLICA/main.jpg', 'Metal legends Metallica take the stage for an explosive night of rock and roll! Experience one of the greatest bands of all time!', 'events/METALLICA/poster.jpg');

-- Insert 5 fechas_eventos
INSERT INTO fechas_eventos (NUM_DIA, MES, NOMBRE_DIA, HORA, MINUTO, CIUDAD, LOCALIZACION, ID_EVENTO) VALUES
(15, 'May', 'Saturday', 20, 0, 'Barcelona', 'Palau Sant Jordi', 1),
(22, 'Jun', 'Friday', 19, 30, 'Madrid', 'Estadio WiZink Center', 2),
(10, 'Jul', 'Wednesday', 21, 0, 'Valencia', 'Ciudad de la Justicia', 3),
(5, 'Aug', 'Monday', 18, 0, 'Barcelona', 'Feria de Barcelona', 4),
(28, 'Sep', 'Saturday', 20, 30, 'Bilbao', 'Bilbao Arena', 5);

-- Insert 5 galeria_eventos
INSERT INTO galeria_eventos (VIDEO, ID_EVENTO) VALUES
('https://www.youtube.com/embed/8Ygk_6ZxpSE', 1),
('https://www.youtube.com/embed/KyBXTFp9sWc', 2),
('https://www.youtube.com/embed/MEqwCmJL2hI', 3),
('https://www.youtube.com/embed/dQw4w9WgXcQ', 4),
('https://www.youtube.com/embed/1kHq9Gs3Sn4', 5);
