FROM scratch
# Vulnerable version
FROM afalko/alpine:53

ADD root.tar /

CMD ["/bin/sh"]
