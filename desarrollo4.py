import psycopg2

# Establecer la conexión con la base de datos
conn = psycopg2.connect(
    host="localhost",
    database="dvdrental",
    user="postgres",
    password="4523"
)

# Crear un cursor
cursor = conn.cursor()

# Ejecutar la consulta
query = "SELECT * FROM film WHERE release_year = 2006 AND rental_rate > 4.0;"
cursor.execute(query)

# Obtener los resultados de la consulta
result = cursor.fetchall()

# Recorrer los resultados e imprimirlos
for row in result:
    print(row)

# Cerrar el cursor y la conexión
cursor.close()
conn.close()
