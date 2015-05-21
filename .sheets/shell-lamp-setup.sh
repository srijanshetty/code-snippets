# Install LAMP stack - Apache, MySQL, PHP
# as per http://fideloper.com/ubuntu-install-php54-lamp and/or http://fideloper.com/ubuntu-12-04-lamp-server-setup

sudo apt-get update                    								# Update package repositories
sudo apt-get install -y git-core wget vim curl build-essential python-software-properties zsh   # Install basics
sudo add-apt-repository -y ppa:ondrej/php5   							# Add repository for  php5.5 and Apache 2.4
sudo apt-get update                    								# Update package repositories again after adding repository
sudo apt-get install -y php5 php5-mcrypt php5-gd php5-curl php5-mysql   			# Install PHP and common modules
sudo apt-get install -y apache2 libapache2-mod-php5                     			# Install Apache2
sudo apt-get install -y mysql-server                                    			# Install MySQL
