import mysql.connector

mydb = mysql.connector.connect(
    host = 'localhost',
    username = 'root',
    password = 'manager',
    database = 'classwork_db'
)


mycursor = mydb.cursor()


sql = "delete from emp where empno = %s"
val = (8000,)

mycursor.execute(sql,val)
print(f"DELETED JHON")

mycursor.close()

mydb.commit()