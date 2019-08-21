# Download base image ubuntu 19.04
FROM ubuntu

# Update Ubuntu Software repository
RUN apt-get update
RUN apt-get dist-upgrade



# create Working directory
WORKDIR /workspace

# install git
RUN apt-get install -y git-core

# Install pip,venv
RUN apt install -y python3-pip

COPY requirements.txt /tmp/
RUN pip3 install --requirement /tmp/requirements.txt

# Credential git
RUN git config --global user.name root

RUN git config --global user.password toor

# Create envi
RUN virtualenv venv
RUN . venv/bin/activate


RUN pip3 install jupyter
EXPOSE 8888

CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root &





