# pull the base image
FROM debian:bookworm-slim


RUN mkdir /copilot
RUN mkdir /copilot/output
RUN mkdir /copilot/exclude
RUN echo "export TERM=dumb" >> ~/.bashrc
RUN echo 'export GOPATH=$HOME/go' >> ~/.bashrc
RUN echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
RUN bash -c "source ~/.bashrc"
# copy current directory files into the container

COPY . /copilot
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh


# set work directory
WORKDIR /copilot

RUN echo "test"> /copilot/output/test.txt

RUN DEBIAN_FRONTEND=noninteractive && apt update
RUN DEBIAN_FRONTEND=noninteractive && apt -y install git wget sudo bash curl


RUN DEBIAN_FRONTEND=noninteractive &&  export TERM=dumb && chmod +x /copilot/webcopilot install.sh && \
    mv /copilot/webcopilot /usr/bin/ && \
    /copilot/install.sh

# command to run on container start


ENTRYPOINT ["/bin/bash", "/usr/bin/entrypoint.sh"]

# build
# docker build -t webcopilot:latest .

# Run using this command
# docker run -it -v $PWD/output:/copilot/output -v $PWD/exclude:/copilot/exclude webcopilot:latest -d <destination> -b <BXSS Server> -a -x /copilot/exclude/exclude.txt -t <number of threads>