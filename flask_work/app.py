# Store this code in 'app.py' file

from flask import Flask, render_template, request, redirect, url_for, session
import re
import mysql.connector

# -----------------------------

app = Flask(__name__)
app.secret_key = 'your_secret_key'


mydb = mysql.connector.connect(
    host='localhost',
    user='root', 
    password='manager',
    database='summarylogin'
)

mycursor = mydb.cursor(dictionary=True)  

# -----------------------------

@app.route('/')
@app.route('/login', methods=['GET', 'POST'])
def login():
    msg = ''
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        username = request.form['username']
        password = request.form['password']
        
        mycursor.execute('SELECT * FROM accounts WHERE username = %s AND password = %s', (username, password))
        account = mycursor.fetchone()
        
        if account:
            session['loggedin'] = True
            session['id'] = account['id']
            session['username'] = account['username']
            msg = 'Logged in successfully!'
            return render_template('index.html', msg=msg)
        else:
            msg = 'Incorrect username/password!'
    
    return render_template('login.html', msg=msg)

@app.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('username', None)
    return redirect(url_for('login'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    msg = ''
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        email = request.form.get('email')

        if not username or not password or not email:
            msg = 'Please fill out the form!'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address!'
        elif not re.match(r'[A-Za-z0-9]+', username):
            msg = 'Username must contain only characters and numbers!'
        else:
            mycursor.execute('SELECT * FROM accounts WHERE username = %s', (username,))
            account = mycursor.fetchone()
            
            if account:
                msg = 'Account already exists!'
            else:
                mycursor.execute('INSERT INTO accounts (username, password, email) VALUES (%s, %s, %s)', 
                                 (username, password, email))
                mydb.commit()
                msg = 'You have successfully registered! You can now log in.'
    
    return render_template('register.html', msg=msg)

if __name__ == '__main__':
    app.run(debug=True)