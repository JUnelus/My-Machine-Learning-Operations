import unittest
from ml_models.model import MLModel


class TestMLModel(unittest.TestCase):
    def setUp(self):
        # Set up dummy training data
        self.X_train = [[0, 0], [1, 1], [1, 0], [0, 1]]
        self.y_train = [0, 1, 1, 0]
        self.model = MLModel()
        self.model.train(self.X_train, self.y_train)  # Train the model with dummy data

    def test_prediction(self):
        # Test if prediction is correct
        result = self.model.predict([[0, 0]])
        self.assertEqual(result[0], 0)  # We expect the model to return 0 for this input

    def test_invalid_input(self):
        # Test if the model raises an error for invalid input
        with self.assertRaises(ValueError):
            self.model.predict([[10]])  # Invalid input should raise a ValueError


if __name__ == '__main__':
    unittest.main()