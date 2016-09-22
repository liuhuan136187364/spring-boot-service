#!/bin/bash
set -eux
exec java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar ${SERVICE_JAR}