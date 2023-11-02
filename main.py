from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import json
from datetime import datetime

local_server = True

app = Flask(__name__)

app.secret_key = "super-secret-key"
with open('config.json', 'r') as c:
    params = json.load(c)['params']

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']  # mysql+pymysql://root:@localhost/coding_finale'
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(10), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_no = db.Column(db.String(12), nullable=False)
    subject = db.Column(db.String(50), nullable=False)
    msg = db.Column(db.String(100), nullable=False)
    date = db.Column(db.String(12), nullable=True)


class Product(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    category = db.Column(db.String(10), nullable=False)
    img_loc = db.Column(db.String(20), nullable=False)
    product_name = db.Column(db.String(50), nullable=False)
    price = db.Column(db.Float, nullable=False)
    quantity = db.Column(db.String(20), nullable=False)
    properties = db.Column(db.String(100), nullable=False)
    details = db.Column(db.String(100), nullable=False)


@app.route('/')
def home():
    prods = db.session.query(Product.category).distinct()
    return render_template('home_page.html', params=params, products=prods)


@app.route('/about')
def about():
    return render_template('aboutus.html', params=params)


@app.route('/mission')
def mission():
    return render_template('mission.html', params=params)


@app.route('/factory')
def factory():
    return render_template('factory.html', params=params)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        '''adding entry to the db for any contact data'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone_no = request.form.get('phoneno')
        subject = request.form.get('subject')
        msg = request.form.get('message')

        entry = Contacts(name=name, email=email, phone_no=phone_no, subject=subject, msg=msg, date=datetime.now())
        db.session.add(entry)
        db.session.commit()

    return render_template('contact.html', params=params)


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    # session.popitem()
    if 'user' in session and session['user'] == params['admin_user']:
        return render_template('dashboard.html', params=params)

    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')

        if username == params['admin_user'] and userpass == params['admin_password']:
            session['user'] = username

            return render_template('dashboard.html', params=params)

    return render_template('login.html', params=params)


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/check")
def checking():
    prods = db.session.query(Product.category).distinct()

    return render_template('home_page.html', params=params, products=prods)


@app.route("/<string:category>" , methods=['GET', 'POST'])
def display_products(category):
    print("category", category)

    prods = Product.query.filter_by(category=category)
    print(prods)
    return render_template('category_products.html', params=params, products=prods)









app.run(debug=True)
