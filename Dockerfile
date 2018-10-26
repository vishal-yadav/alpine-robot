FROM python:2.7-alpine

MAINTAINER Vishal Yadav <vishalcdac07@gmail.com>
LABEL description Robot Framework in Docker.

# Setup volumes for input and output
VOLUME /opt/robotframework/reports
VOLUME /opt/robotframework/tests

# Set number of threads for parallel execution
# By default, no parallelisation
ENV ROBOT_THREADS 1

COPY requirements.txt ./

RUN apk update \
  && apk --no-cache add dumb-init bash musl

#Install RobotFramework and libraries (SeleniumLibrary, SikuliLibrary etc.)
RUN pip install --no-cache-dir -r requirements.txt

# Prepare binaries to be executed
COPY bin/run-tests-in-virtual-screen.sh /opt/robotframework/bin/

# Update system path
ENV PATH=/opt/robotframework/bin:$PATH

# Execute all robot tests
CMD ["dumb-init", "bash", "run-tests-in-virtual-screen.sh"]
