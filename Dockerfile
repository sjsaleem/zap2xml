FROM alpine:3.10.2

ENV USERNAME=<zap2it.com or tvguide.com username>
ENV PASSWORD=<zap2it.com or tvguide.com password>
ENV XMLTV_FILENAME=xmltv.xml
ENV OPT_ARGS=

# Wait 12 Hours after run
ENV SLEEPTIME=43200

RUN apk add --no-cache \
  perl \
  perl-http-cookies \
  perl-lwp-useragent-determined \
  perl-json \
  perl-json-xs \
  perl-lwp-protocol-https \
  perl-gd

VOLUME /data
ADD zap2xml.pl /zap2xml.pl
ADD entry.sh /entry.sh
RUN chmod 755 /entry.sh /zap2xml.pl

CMD ["/entry.sh"]