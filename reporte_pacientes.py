import pyodbc
import pandas as pd

conexion = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=PC-580;"
    "DATABASE=BD_CLINICA_PRACTICA;"
    "Trusted_Connection=yes;"
)

consulta = """
SELECT
    p.NombreCompleto,
    p.Ciudad,
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
    ON m.IdEspecialidad = e.IdEspecialidad
"""

df = pd.read_sql(consulta, conexion)

print(df)