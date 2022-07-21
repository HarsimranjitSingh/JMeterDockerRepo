# escape = \
# This Docker file will create a DOCKER image with JAVA and JMeter to trigger the JMETER Test
FROM ubuntu:latest
ARG jmeter-version=5.4
MAINTAINER harsimranjitsingh@ibm.com
RUN apt update -y \
    && apt upgrade -y \
    && apt install tar -y \
    && apt install wget -y \
    && wget -c https://download.oracle.com/java/18/latest/jdk-18_linux-x64_bin.tar.gz \
    && mkdir -m 777 /JAVA-18 \
    && mv jdk-18_linux-x64_bin.tar.gz /JAVA-18/ \
    && tar -xvzf /JAVA-18/jdk-18_linux-x64_bin.tar.gz -C /JAVA-18/ \
    && rm -rf /JAVA-18/jdk-18_linux-x64_bin.tar.gz
RUN ["/bin/sh","-c","/JAVA-18/jdk-18.0.2/bin/java -version"]
CMD ["/bin/sh","-c","/JAVA-18/jdk-18.0.2/bin/java -version"]
