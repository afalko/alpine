FROM scratch
#FROM afalko/alpine:5

ADD root.tar /
#RUN apk add busybox=1.26.2-r7

CMD ["/bin/sh"]
