# The purpose is to provide gradle tool with oracle JDK8.

FROM java:8-jdk-alpine
MAINTAINER "Wang Wei" <cnetwei@gmail.com>

ENV GRADLE_VERSION 2.14.1
ENV GRADLE_HOME /usr/local/gradle
ENV PATH ${PATH}:${GRADLE_HOME}/bin
ENV GRADLE_USER_HOME /gradle

# Install bash
RUN apk add --update libstdc++ bash && \
    rm -rf /var/cache/apk/*

# Install gradle
WORKDIR /usr/local
RUN wget http://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip gradle-$GRADLE_VERSION-bin.zip && \
    rm -f gradle-$GRADLE_VERSION-bin.zip && \
    ln -s gradle-$GRADLE_VERSION gradle

#
RUN mkdir -p /gradle && mkdir -p /app

WORKDIR /app
# ENTRYPOINT gradle
# CMD bootRepackage
