FROM scratch

ADD root.tar /
RUN apk add busybox=1.26.2-r7

CMD ["/bin/sh"]
