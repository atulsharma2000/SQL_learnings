import mysql.connector

mydb = mysql.connector.connect(
    host= 'localhost',
    username = 'root',
    password = 'manager',
    database = 'classwork_db'
)

mycursor = mydb.cursor()


sql = "update emp set sal = %s where empno = %s "
val= (6000,8000)
# jhon bhai 
mycursor.execute(sql,val)

mycursor.close()
mydb.commit()