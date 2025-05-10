# Use slim base image
FROM python:3.11-slim

# Create a non-root user
RUN adduser --disabled-password --gecos '' appuser

# Set workdir and copy files
WORKDIR /app
COPY app.py /app/

# Install dependencies
RUN pip install --no-cache-dir flask

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]

