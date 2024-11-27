import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    username="root",
    password="manager",
    database="classwork_db"
)


mycursor = mydb.cursor()

mycursor.execute("select empno,ename,sal from emp")
result = mycursor.fetchall()

for ele in result:
    print(ele)


mycursor.close()