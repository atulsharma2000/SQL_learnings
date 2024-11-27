import mysql.connector

mydb = mysql.connector.connect(
    host = 'localhost',
    username = 'root',
    password = 'manager',
    database = 'classwork_db'
)

mycursor = mydb.cursor()

sql = "INSERT into emp(empno,ename,sal) values(%s,%s,%s)"
val = (8001,"ANIL",4000)
mycursor.execute(sql,val)
mydb.commit()


mycursor.close()