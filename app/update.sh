echo "deb http://archive.debian.org/debian/ stretch main contrib non-free" > /etc/apt/sources.list \
&& echo "deb http://archive.debian.org/debian-security/ stretch/updates main" >> /etc/apt/sources.list \
&& apt-get update \
&& apt-get install -y nmap \
&& apt-get install -y curl \
&& apt-get install -y wget \
&& apt-get install -y git \
&& apt-get install -y awscli \
&& apt-get install -y mysql-client \
&& rm -rf /var/lib/apt/lists/* 