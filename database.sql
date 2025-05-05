CREATE DATABASE GestionClientesDB;
GO

USE GestionClientesDB;
GO

-- Tabla de usuarios
CREATE TABLE Usuarios (
    Id INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario NVARCHAR(50) NOT NULL UNIQUE,
    ContrasenaHash NVARCHAR(255) NOT NULL,
	Activo BIT NOT NULL DEFAULT 1
);
GO

-- Tabla de clientes
CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Correo NVARCHAR(100),
    Telefono NVARCHAR(20),
    Direccion NVARCHAR(255),
	Activo BIT NOT NULL DEFAULT 1
);
GO

-- Tabla de bitácora
CREATE TABLE Bitacora (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UsuarioId INT,
    ClienteId INT,
    Accion NVARCHAR(MAX),
    Fecha DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id),
    FOREIGN KEY (ClienteId) REFERENCES Clientes(Id)
);
GO

INSERT INTO Usuarios(NombreUsuario, ContrasenaHash) VALUES ('admin','JAvlGPq9JyTdtvBO6x2llnRI1+gxwIyPqCKAn3THIKk=');
GO