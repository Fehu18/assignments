# File: app.py

from flask import Flask

# Create a Flask application
app = Flask(__name__)

# Define a route for the root URL
@app.route('/')
def hello():
    return 'Hello, World! This is a sample Flask application.'

# Define a route for '/about'
@app.route('/about')
def about():
    return 'This is a simple Flask web application.'

# Run the Flask application if executed directly
if __name__ == '__main__':
    app.run(debug=True)
