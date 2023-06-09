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
query = "SELECT payment_id, payment_date, amount FROM payment;"
cursor.execute(query)

# Obtener los resultados de la consulta
results = cursor.fetchall()

# Imprimir los resultados
for row in results:
    payment_id = row[0]
    payment_date = row[1]
    amount = row[2]
    print(f"Payment ID: {payment_id}, Payment Date: {payment_date}, Amount: {amount}")

# Cerrar el cursor y la conexión
cursor.close()
conn.close()
