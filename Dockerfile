FROM aarch64/java:openjdk-8-jdk

COPY tini-static-arm64 /usr/bin/tini
RUN chmod +x /usr/bin/tini
  
ARG SERVICE_JAR
ARG SERVICE_JAR_FROM
ARG EXPOSE_PORT

ENV SERVICE_JAR ${SERVICE_JAR}
ENV JAVA_OPTS="-Xms256m -Xmx256m"

COPY ${SERVICE_JAR_FROM} /${SERVICE_JAR}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE ${EXPOSE_PORT}

ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]