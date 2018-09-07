FROM scratch
# Vulnerable version
#FROM afalko/alpine:5

ADD root.tar /

CMD ["/bin/sh"]
