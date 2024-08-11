# Base image
FROM python:3.8-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Expose port 8888 for Jupyter Notebook
EXPOSE 8888

# Set environment variables for Jupyter
ENV JUPYTER_TOKEN=my_secret_token
ENV JUPYTER_ENABLE_LAB=yes

# Command to run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=${JUPYTER_TOKEN}"]
