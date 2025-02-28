import numpy as np
import matplotlib.pyplot as plt

# Dataset from the table
dataset = [
    [0.4, -0.7, 0.1],
    [0.3, -0.5, 0.05],
    [0.6, 0.1, 0.3],
    [0.2, 0.4, 0.25],
    [0.1, -0.2, 0.12]
]

# Convert dataset to numpy arrays
inputs = np.array([[row[0], row[1]] for row in dataset])
actual_outputs = np.array([row[2] for row in dataset])

# Initialize random weights and bias
np.random.seed(42)  # For reproducibility
weights = np.random.rand(2)  # Two input weights
bias = np.random.rand(1)[0]  # One bias term

def sigmoid(x):
    """Sigmoid activation function"""
    return 1 / (1 + np.exp(-x))

def sigmoid_derivative(x):
    """Derivative of sigmoid function"""
    return x * (1 - x)

# Training parameters
learning_rate = 0.1
epochs = 10000
error_history = []

# Training the neural network
for epoch in range(epochs):
    total_error = 0
    
    for i in range(len(dataset)):
        # Forward pass
        x = inputs[i]
        y_true = actual_outputs[i]
        
        # Calculate weighted sum
        z = np.dot(weights, x) + bias
        
        # Apply activation function
        y_pred = sigmoid(z)
        
        # Calculate error
        error = y_true - y_pred
        total_error += error**2
        
        # Backpropagation
        # Calculate gradients
        d_error_d_ypred = -2 * error
        d_ypred_d_z = sigmoid_derivative(y_pred)
        
        # Chain rule to find gradient of error with respect to weights and bias
        d_error_d_weights = d_error_d_ypred * d_ypred_d_z * x
        d_error_d_bias = d_error_d_ypred * d_ypred_d_z
        
        # Update weights and bias
        weights -= learning_rate * d_error_d_weights
        bias -= learning_rate * d_error_d_bias
    
    # Record mean squared error for this epoch
    mean_error = total_error / len(dataset)
    error_history.append(mean_error)
    
    # Early stopping if error is small enough
    if mean_error < 0.0001:
        print(f"Converged at epoch {epoch}")
        break

# Test the trained model
print("\nTraining complete!")
print(f"Final weights: {weights}")
print(f"Final bias: {bias}")

print("\nPredictions vs Actual values:")
for i in range(len(dataset)):
    x = inputs[i]
    y_true = actual_outputs[i]
    
    # Forward pass
    z = np.dot(weights, x) + bias
    y_pred = sigmoid(z)
    
    print(f"Input: {x}, Predicted: {y_pred:.4f}, Actual: {y_true:.4f}, Error: {abs(y_true - y_pred):.4f}")

# Plot error over time
plt.figure(figsize=(10, 6))
plt.plot(error_history)
plt.title('Mean Squared Error vs Epochs')
plt.xlabel('Epochs')
plt.ylabel('Mean Squared Error')
plt.grid(True)
plt.yscale('log')  # Log scale to better visualize error decrease

# Visualize the model predictions
plt.figure(figsize=(10, 6))
plt.scatter(range(len(dataset)), actual_outputs, color='blue', label='Actual')
predicted = [sigmoid(np.dot(weights, inputs[i]) + bias) for i in range(len(dataset))]
plt.scatter(range(len(dataset)), predicted, color='red', label='Predicted')
plt.xlabel('Sample Index')
plt.ylabel('Output Value')
plt.title('Actual vs Predicted Values')
plt.legend()
plt.grid(True)

print("\nModel visualization can be done using the matplotlib code included.")