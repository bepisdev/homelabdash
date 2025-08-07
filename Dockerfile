FROM perl
WORKDIR /opt/homelabdash
COPY conf.example.yml /config/dashboard.yml
COPY . .
RUN cpanm --installdeps -n .
EXPOSE 3333
CMD perl bin/homelabdash.pl --config /config/dashboard.yml
