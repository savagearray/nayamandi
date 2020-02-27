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

@app.route("/incentives")
def incentives():
    return render_template('incentives.html')

@app.route("/ml_working")
def ml_working():
    return render_template('ml_working.html')

@app.route("/future_prediction")
def future_prediction():
    return render_template('future_prediction.html')

@app.route("/registration")
def registration():
    return render_template('registration.html')

@app.route("/about_us")
def about_us():
    return render_template('about_us.html')

@app.route("/contact_us")
def contact_us():
    return render_template('contact_us.html')

@app.route("/features")
def features():
    return render_template('features.html')

@app.route("/login_consumers")
def login_consumers():
    return render_template('login_consumers.html')

@app.route("/login_sellers")
def login_sellers():
    return render_template('login_sellers.html')



if __name__ == '__main__':
    app.run(debug=True)
#FLASK_APP=filename.py FLASK_ENV=development flask run –port 8080