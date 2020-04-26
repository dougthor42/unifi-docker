FROM ubuntu:18.04

LABEL maintainer="Douglas Thor <doug.thor@gmail.com>"

# Install prereqs and GPG keys
RUN apt update \
    && apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        wget \
    # These commands were pulled from
    # https://help.ui.com/hc/en-us/articles/220066768-UniFi-How-to-Install-and-Update-via-APT-on-Debian-or-Ubuntu
    # I have not spent the time to optimize them. Eg: why they hell use `tee`?
    && echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' > /etc/apt/sources.list.d/100-ubnt-unifi.list \
    && wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | apt-key add - \
    && echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list \
    && apt update
