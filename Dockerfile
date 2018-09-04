#FROM scratch
FROM afalko/alpine:5  # Vulnerable version

ADD root.tar /

CMD ["/bin/sh"]
