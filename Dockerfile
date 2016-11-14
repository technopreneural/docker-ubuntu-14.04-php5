FROM		technopreneural/docker-ubuntu-14.04-apache2
MAINTAINER	technopreneural@yahoo.com

# Install PHP5 components
RUN		apt-get update \
		&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
			curl \
			git \
			libapache2-mod-php5 \
			php5 \
			php5-cli \
			php5-curl \
			php5-dev \
			php5-gd \
			php5-imagick \
			php5-intl \
			php5-mcrypt \
			php5-memcache \
			php5-mhash \
			php5-mysql \
			php5-pgsql \
			php5-sqlite \
			php5-xmlrpc \
			php5-xsl \

# Configure MCrypt
		&& php5enmod mcrypt \

# Install Composer
		&& php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
		&& php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
		&& php composer-setup.php \
		&& php -r "unlink('composer-setup.php');" \
		&& mv composer.phar /usr/local/bin/composer
