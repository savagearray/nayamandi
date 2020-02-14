from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')

@app.route("/commodity")
def commodity():
    return render_template('commodity.html')

@app.route("/license")
def license():
    return render_template('license.html')

@app.route("/price_details")
def price_details():
    return render_template('price_details.html')

if __name__ == '__main__':
    app.run(debug=True)
#FLASK_APP=filename.py FLASK_ENV=development flask run –port 8080