# 1) Base image

# 2) Prevent .pyc files and enable unbuffered logs


# 3) Create work directory


# 4) Install dependencies first (better caching)

# 5) Copy app source


# 6) Expose port and run

# Start from a minimal Python image
FROM python:3.10-slim

# Optional environment setup
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]