
# A dockerfile must always start by importing the base image.
# We use the keyword 'FROM' to do that.
# In our example, we want import the python image.
# So we write 'python' for the image name and 'latest' for the version.
FROM alpine:latest
RUN apk add python3 uv gcc musl-dev python3-dev libffi-dev openssl-dev 
COPY pyproject.toml ./
RUN uv sync
COPY *.py /
COPY ./iot_telemetry_data.csv ./
# In order to launch our python code, we must import it into our image.
# We use the keyword 'COPY' to do that.
# The first parameter 'main.py' is the name of the file on the host.
# The second parameter '/' is the path where to put the file on the image.
# Here we put the file at the image root folder.

# We need to define the command to launch when we are going to run the image.
# We use the keyword 'CMD' to do that.
# The following command will execute "python ./main.py".
CMD [ "uv","run", "./extract.py" ]
