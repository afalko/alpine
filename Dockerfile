FROM scratch
# Vulnerable version
FROM afalko/alpine:36

ADD root.tar /

CMD ["/bin/sh"]
