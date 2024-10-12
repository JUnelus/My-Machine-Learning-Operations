import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from flask import Flask, request, jsonify
from ml_models.model import MLModel
import numpy as np

app = Flask(__name__)
model = MLModel()

@app.route('/')
def home():
    return "Welcome to the MLOps Model API!"

# Dummy training data
X_train = np.array([[0, 0], [1, 1], [1, 0], [0, 1]])
y_train = np.array([0, 1, 1, 0])

# Fit the model (Train the model before prediction)
model.train(X_train, y_train)

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.json
        prediction = model.predict(data['input'])
        return jsonify({'prediction': prediction.tolist()})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
