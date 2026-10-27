import pyodbc

try:

    conexion = pyodbc.connect(
        "DRIVER={ODBC Driver 17 for SQL Server};"
        "SERVER=PC-580;"
        "DATABASE=BD_CLINICA_PRACTICA;"
        "Trusted_Connection=yes;"
    )

    print("Conexion exitosa")

except Exception as e:

    print("Error:")
    print(e)