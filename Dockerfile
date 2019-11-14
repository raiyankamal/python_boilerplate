# Using the official Python 3.7 runtime as a parent image
FROM python:3.7-alpine

# Install software needed in the container
RUN apk update && apk add vim
RUN pip install --upgrade pip

# Python output is set straight to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# Expose ports
# in case we want to run an webserver inside the container
EXPOSE 8000

# Install project dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Root directory for our project in the container
RUN mkdir /application

# Copy the current directory contents into the container at /application
ADD ./src /application/

# Set the working directory to /application
WORKDIR /application

# Set entrypoint to the container
CMD ["sh", "run.sh"]
