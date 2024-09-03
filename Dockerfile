# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the API code into the container
COPY app.py /app/

# Install Flask
RUN pip install flask

# Define the command to run the application
CMD ["python", "app.py"]
