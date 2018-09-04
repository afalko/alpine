FROM scratch
FROM afalko/alpine:27

ADD root.tar /
#RUN apk add busybox=1.26.2-r7

CMD ["/bin/sh"]
