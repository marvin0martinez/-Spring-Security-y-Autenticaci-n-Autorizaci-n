CREATE DATABASE auth_db;

USE auth_db;
GO

-- Datos iniciales (solo para desarrollo)
PRINT 'Inserting initial data...';

-- Crear tabla de usuarios
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
    CREATE TABLE users (
        id INT IDENTITY(1,1) PRIMARY KEY,
        email NVARCHAR(255) NOT NULL UNIQUE,
        password NVARCHAR(255) NOT NULL
    );
    PRINT 'Table users created successfully.';
END
ELSE
BEGIN
    PRINT 'Table users already exists.';
END
GO

-- Usuario admin
IF NOT EXISTS (SELECT 1 FROM users WHERE email = 'admin@example.com')
BEGIN
    INSERT INTO users (email, password) 
    VALUES ('admin@example.com', '$2a$10$xLFtBIXGtYvAbRqM1Jiw3eAGBzH9M7bW7F3LZ6QzK7tJv1VvD7XZa'); -- password: Test1234
    PRINT 'Admin user inserted.';
END
ELSE
BEGIN
    PRINT 'Admin user already exists.';
END

-- Usuario normal
IF NOT EXISTS (SELECT 1 FROM users WHERE email = 'user@example.com')
BEGIN
    INSERT INTO users (email, password) 
    VALUES ('user@example.com', '$2a$10$xLFtBIXGtYvAbRqM1Jiw3eAGBzH9M7bW7F3LZ6QzK7tJv1VvD7XZa'); -- password: Test1234
    PRINT 'Regular user inserted.';
END
ELSE
BEGIN
    PRINT 'Regular user already exists.';
END

PRINT 'Initial data insertion completed.';
GO