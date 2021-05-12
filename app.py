from flask import Flask, json
from flask import jsonify
from flask import request
from flask import make_response
import pymysql.cursors 
from flask_cors import CORS,cross_origin
import string
import random
from datetime import *
app = Flask(__name__)

CORS(app)
 
conn = pymysql.connect(host='localhost',
                       user='root',
                       password='',
                       db='asha',
                       charset='utf8mb4',
                       cursorclass=pymysql.cursors.DictCursor)

def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

@app.route('/login', methods =['POST'])
def login():
    data = request.get_json()
    cursor = conn.cursor()
    if(data["userType"] == "listener"):
         query = 'SELECT * FROM `listener` WHERE `email` = %(emailValue)s AND `password` = %(passwordValue)s '
         cursor.execute(query,data)
         result = cursor.fetchall()
         if(result):
            return jsonify(result)
    if(data["userType"] == "artist"):
        query = 'SELECT * FROM `artist` WHERE `email` = %(emailValue)s AND `password` = %(passwordValue)s '
        cursor.execute(query,data)
        result = cursor.fetchall()
        if(result):
             return jsonify(result)
    return jsonify(100)

@app.route('/register',methods =['POST'])
def signUp():
    create_id = id_generator(6)
    data = request.get_json()
    data["id"] = create_id 
    cursor = conn.cursor()
    if(data["userType"] == "listener"):
        query = 'INSERT INTO `listener`(`first_name`, `last_name`, `email`, `password`,date_of_birth) \
        VALUES (%(firstNameValue)s,%(lastNameValue)s,%(emailValue)s,%(passwordValue)s,%(dobValue)s) '
        cursor.execute(query,data)
        return jsonify(50)
    elif(data["userType"] == "artist"):
        query = 'INSERT INTO `artist`(`artist_name`, `first_name`, `last_name`, `email`, `password`,date_of_birth) \
        VALUES (%(artistNameValue)s,%(firstNameValue)s,%(lastNameValue)s,%(emailValue)s,%(passwordValue)s,%(dobValue)s) '
        cursor.execute(query,data)
        return jsonify(50)
    return jsonify(100)

@app.route('/')
def hello_world():
    return 'Hello, World!'


if __name__ == "__main__":
	app.run(host="localhost",port = 5000, debug=True,threaded = True)