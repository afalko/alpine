FROM scratch
# Vulnerable version
FROM afalko/alpine:30

ADD root.tar /

CMD ["/bin/sh"]
