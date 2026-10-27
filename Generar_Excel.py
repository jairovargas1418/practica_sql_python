import pyodbc
import pandas as pd

conexion = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=PC-580;"
    "DATABASE=BD_CLINICA_PRACTICA;"
    "Trusted_Connection=yes;"
)

consulta = """
SELECT *
FROM Paciente
"""

df = pd.read_sql(consulta, conexion)

df.to_excel(
    "reportes/pacientes.xlsx",
    index=False
)

print("Archivo generado correctamente")