USE BD_CLINICA_PRACTICA;
GO

INSERT INTO Especialidad(Nombre)
VALUES
('Medicina General'),
('Pediatria'),
('Ginecologia'),
('Cardiologia'),
('Dermatologia');
GO

select *
from Especialidad

INSERT INTO Medico
(
    NombreCompleto,
    RegistroMedico,
    IdEspecialidad
)
VALUES
('Juan Camilo Perez','RM001',1),
('Laura Torres','RM002',2),
('Carlos Ruiz','RM003',3),
('Diana Gomez','RM004',4),
('Andres Martinez','RM005',5);
GO

select *
from Medico


INSERT INTO Paciente
(
    TipoDocumento,
    NumeroDocumento,
    NombreCompleto,
    FechaNacimiento,
    Telefono,
    Ciudad
)
VALUES
('CC','1001','Maria Lopez','1985-05-20','3001111111','Bogota'),
('CC','1002','Pedro Garcia','1978-09-15','3002222222','Tunja'),
('CC','1003','Sandra Rojas','1990-11-30','3003333333','Bucaramanga'),
('CC','1004','Luis Herrera','2000-02-14','3004444444','Bogota'),
('CC','1005','Juliana Diaz','1995-07-18','3005555555','Bucaramanga');
GO


select *
from Paciente


INSERT INTO Cita
(
    IdPaciente,
    IdMedico,
    FechaCita,
    Estado
)
VALUES
(1,1,'2026-10-20 08:00','Atendida'),
(2,4,'2026-10-20 09:00','Atendida'),
(3,2,'2026-10-20 10:00','Atendida'),
(4,1,'2026-10-21 08:00','Programada'),
(5,3,'2026-10-21 09:00','Programada');
GO

select *
from Cita


INSERT INTO Consulta
(
    IdCita,
    Diagnostico,
    Observaciones
)
VALUES
(1,'Hipertension','Control de tension arterial'),
(2,'Arritmia','Paciente estable'),
(3,'Infeccion respiratoria','Formula antibiotico');
GO

INSERT INTO Factura
(
    IdConsulta,
    FechaFactura,
    Valor
)
VALUES
(1,GETDATE(),85000),
(2,GETDATE(),120000),
(3,GETDATE(),95000);
GO

select *
from factura

SELECT * FROM Especialidad;
SELECT * FROM Medico;
SELECT * FROM Paciente;
SELECT * FROM Cita;
SELECT * FROM Consulta;
SELECT * FROM Factura;



SELECT
    p.NombreCompleto AS Paciente,
    m.NombreCompleto AS Medico,
    e.Nombre AS Especialidad,
    c.FechaCita,
    c.Estado
FROM Cita c
INNER JOIN Paciente p
    ON c.IdPaciente = p.IdPaciente
INNER JOIN Medico m
    ON c.IdMedico = m.IdMedico
INNER JOIN Especialidad e
    ON m.IdEspecialidad = e.IdEspecialidad;

