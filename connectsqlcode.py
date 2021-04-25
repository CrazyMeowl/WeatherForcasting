import pyodbc

for driver in pyodbc.drivers():
	print(driver)

def read(conn):
	print("Read")
	cursor = conn.cursor()
	cursor = cursor.execute("select * from dummy")
	for row in cursor:
		print(f'row = {row}')
	print()


def create(conn):
	print("Create")
	cursor = conn.cursor()
	cursor.execute(
		'insert into dummy(a,b) values(?,?);',(1,'catzzz')
	)
	conn.commit()
	read(conn)

def update(conn):
	print("Update")
	cursor = conn.cursor()
	cursor.execute(
		'update dummy set b = ? where a = ?;',('dogzzz',1)
	)
	conn.commit()
	read(conn)

def delete(conn):
	print("Delete")
	cursor = conn.cursor()
	cursor.execute(
		'delete from dummy where a < 5' # xóa hàng trong bảng dummy với giá trị ở cột a bé hơn 0
	)
	conn.commit()
	read(conn)

conn = pyodbc.connect(
	"Driver= {SQL Server Native Client 11.0};"# Driver dont change
	"Server=DESKTOP-NE9027C;" #Change this into LAPTOP-XXXXXXX
	"Database=TestDPM;"#Database name
	"Trusted_Connection=yes;"
)

read(conn)

create(conn)

update(conn)

delete(conn)