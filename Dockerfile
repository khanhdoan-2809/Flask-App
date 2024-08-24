# base image
FROM python:3.11-slim-buster

# sets the working directory inside the container to /app
WORKDIR /app

# copies the requirements.txt file from local machine to the /app
COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

# copies the app directory from local machine to the /app
COPY app .

ENV FLASK_APP=app   
ENV FLASK_ENV=development

EXPOSE 5000

RUN python init_db.py

# command to run when the container starts.
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0","--port","5000"]