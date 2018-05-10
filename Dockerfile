#our base image
FROM alpine:3.5

#install python and pip
RUN apk add --update py2-pip

#install needed modules
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

#copy files
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

#set the port number
EXPOSE 5000

#run the app
CMD ["python", "/usr/src/app/app.py"]