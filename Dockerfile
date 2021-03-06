FROM ubuntu:trusty

RUN apt-get update; apt-get install -y openjdk-6-jre unzip

RUN useradd --create-home -u 1013 ircbot
ADD target/ircbot-1.0-SNAPSHOT-bin.zip /usr/local/bin/ircbot.zip
RUN cd /usr/local/bin; unzip ircbot.zip

EXPOSE 8080
USER ircbot

ENTRYPOINT ["java", "-Dircbot.name=jenkins-admin", "-jar", "/usr/local/bin/ircbot-1.0-SNAPSHOT.jar"]
