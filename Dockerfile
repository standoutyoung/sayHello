# STEP 1: Setup
FROM openjdk:8-jdk-slim

WORKDIR app
ADD target/sayHello.jar sayHello.jar
#设置时间为中国上海，默认为UTC时间
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV LD_LIBRARY_PATH $JAVA_HOME/jre/lib/amd64/server

ENTRYPOINT ["java","-jar","sayHello.jar"]
