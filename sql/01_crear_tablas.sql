USE BD_CLINICA_PRACTICA;
GO

/* -------------------------
   ESPECIALIDAD
--------------------------*/

CREATE TABLE Especialidad
(
    IdEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);
GO

/* -------------------------
   MEDICO
--------------------------*/

CREATE TABLE Medico
(
    IdMedico INT IDENTITY(1,1) PRIMARY KEY,
    NombreCompleto VARCHAR(150) NOT NULL,
    RegistroMedico VARCHAR(50),
    IdEspecialidad INT NOT NULL,

    CONSTRAINT FK_Medico_Especialidad
        FOREIGN KEY (IdEspecialidad)
        REFERENCES Especialidad(IdEspecialidad)
);
GO

/* -------------------------
   PACIENTE
--------------------------*/

CREATE TABLE Paciente
(
    IdPaciente INT IDENTITY(1,1) PRIMARY KEY,
    TipoDocumento VARCHAR(10),
    NumeroDocumento VARCHAR(20),
    NombreCompleto VARCHAR(150),
    FechaNacimiento DATE,
    Telefono VARCHAR(20),
    Ciudad VARCHAR(100)
);
GO

/* -------------------------
   CITA
--------------------------*/

CREATE TABLE Cita
(
    IdCita INT IDENTITY(1,1) PRIMARY KEY,

    IdPaciente INT NOT NULL,
    IdMedico INT NOT NULL,

    FechaCita DATETIME NOT NULL,

    Estado VARCHAR(30),

    CONSTRAINT FK_Cita_Paciente
        FOREIGN KEY (IdPaciente)
        REFERENCES Paciente(IdPaciente),

    CONSTRAINT FK_Cita_Medico
        FOREIGN KEY (IdMedico)
        REFERENCES Medico(IdMedico)
);
GO

/* -------------------------
   CONSULTA
--------------------------*/

CREATE TABLE Consulta
(
    IdConsulta INT IDENTITY(1,1) PRIMARY KEY,

    IdCita INT NOT NULL,

    Diagnostico VARCHAR(500),

    Observaciones VARCHAR(1000),

    CONSTRAINT FK_Consulta_Cita
        FOREIGN KEY (IdCita)
        REFERENCES Cita(IdCita)
);
GO

/* -------------------------
   FACTURA
--------------------------*/

CREATE TABLE Factura
(
    IdFactura INT IDENTITY(1,1) PRIMARY KEY,

    IdConsulta INT NOT NULL,

    FechaFactura DATE,

    Valor DECIMAL(18,2),

    CONSTRAINT FK_Factura_Consulta
        FOREIGN KEY (IdConsulta)
        REFERENCES Consulta(IdConsulta)
);
GO



SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_NAME;