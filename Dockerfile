FROM scratch
# Vulnerable version
FROM afalko/alpine:34

ADD root.tar /

CMD ["/bin/sh"]
