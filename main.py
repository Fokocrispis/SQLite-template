import sqlite3
# Basic structure for SQLite with fundamental functions to create tables, add information and manipulation information on said tables

# Connect to (or create) a database file
conn = sqlite3.connect('orders.db')
cursor = conn.cursor()

# Create tables
# Add NOT NULL to avoid null values
cursor.execute("""CREATE TABLE IF NOT EXISTS users(
   userid INT PRIMARY KEY,
   fname TEXT, 
   lname TEXT,
   gender TEXT);
""")
conn.commit()

cursor.execute("""CREATE TABLE IF NOT EXISTS orders(
   orderid INT PRIMARY KEY,
   date TEXT,
   userid INT,
   total TEXT,
   FOREIGN KEY(userid) REFERENCES users(userid));
""")
conn.commit()

# Add information to users table
cursor.execute("""INSERT OR IGNORE INTO users(userid, fname, lname, gender) 
   VALUES(1, 'Nik', 'Piepenbreier', 'male');""")
conn.commit()

# Add information 2nd way
user = (2, 'Lois', 'Lane', 'Female')
cursor.execute("INSERT OR IGNORE INTO users VALUES(?, ?, ?, ?);", user)
conn.commit()

# Add information 3rd way
more_users = [
    (3, 'Peter', 'Parker', 'Male'),
    (4, 'Bruce', 'Wayne', 'male')
]
cursor.executemany("INSERT OR IGNORE INTO users VALUES(?, ?, ?, ?);", more_users)
conn.commit()

# Add orders
orders = [
    (1, '2024-01-01', 1, '100.50'),
    (2, '2024-01-02', 2, '200.75'),
    (3, '2024-01-03', 3, '150.00')
]
cursor.executemany("INSERT OR IGNORE INTO orders VALUES(?, ?, ?, ?);", orders)
conn.commit()

# Fetch info
cursor.execute("SELECT * FROM users;")
one_result = cursor.fetchone()
print("Single Fetch Result:", one_result)

# Fetch many
cursor.execute("SELECT * FROM users;")
three_results = cursor.fetchmany(3)
print("Fetch Many Results:", three_results)

# Fetch all orders for verification
cursor.execute("SELECT * FROM orders;")
all_orders = cursor.fetchall()
print("All Orders:", all_orders)

# Delete
cursor.execute("DELETE FROM users WHERE lname='Parker';")
conn.commit()
cursor.execute("select * from users where lname='Parker'")
print(cursor.fetchall())

# Join tables
cursor.execute("""SELECT *, users.fname, users.lname FROM orders
    LEFT JOIN users ON users.userid=orders.userid;""")
print(cursor.fetchall())

# Close the connection
conn.close()
