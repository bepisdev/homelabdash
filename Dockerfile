FROM alpine:latest
WORKDIR /opt/homelabdash

ENV PERL_MM_USE_DEFAULT=1

RUN apk add --no-cache \
    curl \
    openssl \
    perl \
    build-base \
    perl-dev \
		perl-app-cpanminus

COPY . .
COPY conf.example.yaml /config/dashboard.yml

RUN cpanm --notest --install-deps .
RUN perl Makefile.PL
RUN make all
RUN make install

CMD ["perl", "-v"]
