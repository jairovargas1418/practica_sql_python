import pyodbc
import pandas as pd

conexion = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=PC-580;"
    "DATABASE=BD_CLINICA_PRACTICA;"
    "Trusted_Connection=yes;"
)


print("✅ Conexión exitosa")


## Consulta 1: Pacientes por ciudad

sql_pacientes_ciudad = """
SELECT
    Ciudad,
    COUNT(*) AS TotalPacientes
FROM Paciente
GROUP BY Ciudad
ORDER BY TotalPacientes DESC
"""

df_pacientes_ciudad = pd.read_sql(
    sql_pacientes_ciudad,
    conexion
)


## Consulta 2: Citas por médico

sql_citas_medico = """
SELECT
    m.NombreCompleto AS Medico,
    COUNT(*) AS TotalCitas
FROM Cita c
INNER JOIN Medico m
    ON c.IdMedico = m.IdMedico
GROUP BY m.NombreCompleto
ORDER BY TotalCitas DESC
"""

df_citas_medico = pd.read_sql(
    sql_citas_medico,
    conexion
)

## Consulta 3: Citas por especialidad

sql_especialidad = """
SELECT
    e.Nombre AS Especialidad,
    COUNT(*) AS TotalCitas
FROM Cita c
INNER JOIN Medico m
    ON c.IdMedico = m.IdMedico
INNER JOIN Especialidad e
    ON m.IdEspecialidad = e.IdEspecialidad
GROUP BY e.Nombre
ORDER BY TotalCitas DESC
"""

df_especialidad = pd.read_sql(
    sql_especialidad,
    conexion
)

## Consulta 4: Facturación

sql_facturacion = """
SELECT
    SUM(Valor) AS FacturacionTotal
FROM Factura
"""

df_facturacion = pd.read_sql(
    sql_facturacion,
    conexion
)


## Consultas validacion de datos
sql_resumen = """
SELECT
    (SELECT COUNT(*) FROM Paciente) AS TotalPacientes,
    (SELECT COUNT(*) FROM Medico) AS TotalMedicos,
    (SELECT COUNT(*) FROM Cita) AS TotalCitas,
    (SELECT COUNT(*) FROM Consulta) AS TotalConsultas,
    (SELECT COUNT(*) FROM Factura) AS TotalFacturas
"""

df_resumen = pd.read_sql(
    sql_resumen,
    conexion
)




print(df_resumen)
print(df_facturacion)

print("FIN DEL PROGRAMA")

df_resumen.to_excel(
    "Reportes/prueba.xlsx",
    index=False
)


with pd.ExcelWriter(
    "Reportes/Dashboard_Clinica.xlsx",
    engine="openpyxl"
) as writer:

    df_resumen.to_excel(
        writer,
        sheet_name="ResumenGeneral",
        index=False
    )

    df_pacientes_ciudad.to_excel(
        writer,
        sheet_name="PacientesCiudad",
        index=False
    )

    df_citas_medico.to_excel(
        writer,
        sheet_name="CitasMedico",
        index=False
    )

    df_especialidad.to_excel(
        writer,
        sheet_name="Especialidades",
        index=False
    )

    df_facturacion.to_excel(
        writer,
        sheet_name="Facturacion",
        index=False
    )

print("✅ Dashboard generado correctamente")