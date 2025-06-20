from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/hello', methods=['GET'])
def hello():
    return jsonify({"message": "Hola Mundo desde Flask!"})

@app.route('/api/suma/<int:a>/<int:b>', methods=['GET'])
def suma(a, b):
    return jsonify({"resultado": a + b})

@app.route('/api/multiplicar/<int:a>/<int:b>', methods=['GET'])
def multiplicar(a, b):
    return jsonify({"resultado": a * b})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
