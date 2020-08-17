#!/bin/bash
export JAVA_HOME=/usr/local/openjdk-8/jre;
echo "Script started" >> /var/log/cron.log 2>&1
cd /src && mvn clean test -DargLine='-Dkarate.env=docker' -Dtest=WebRunner >> /var/log/cron.log 2>&1