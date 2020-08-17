FROM ptrthomas/karate-chrome:latest
MAINTAINER gadireddi226
RUN apt-get update
RUN apt-get install cron -y
ADD /jobserver /src

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/crontab
ADD runTests.sh runTests.sh
RUN chmod +x runTests.sh
RUN chmod 0644 /etc/cron.d/crontab

RUN crontab /etc/cron.d/crontab
# Create the log file to be able to run tail
RUN touch /var/log/cron.log

CMD /entrypoint.sh & cron && tail -f /var/log/cron.log