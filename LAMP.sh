#!/bin/bash
#Creator : DorShamay
#Porpuse : Installing LAMP server
#Version : 0.0.1


# Check if user is root
checkroot()
{
if [ $(id -u) != "0" ]; then
		echo "You are not root , Exiting"
		exit 1;
	fi
}

apache()
{
# Installing apache2 (WebServer)
apt-get install -y apache2


}

ngnix()
{
#Installing Ngnix (Webserver)
echo "Before Installing Ngnix on Deb/Ubuntu You'll need some repos of the package, Let me do it for you"
echo deb http://nginx.org/packages/ubuntu/ >> /etc/apt/sources.list
echo deb-src http://nginx.org/packages/ubuntu/ >> /etc/apt/sources.list
echo "As we all know we need to update the repos after adding new ones"
apt-get update
apt-get install -y ngnix

}

webmenu()
{
echo "Which webserver you want to install?"
select webserv in  "Apache2" "Ngnix" "Quit"
	do
		case $webserv in
			"Apache2" | "apache2")
		apache
		  printf "\n"
		  printf "\n"
			;;
			"Ngnix" | "ngnix")
		ngnix
		  printf "\n"
		  printf "\n"
			;;
			"Quit" | "q")
		exit 0
			;;
				*)
					echo "Please enter Valid Selection"
			;;
		esac
	done

{

checkroot
webmenu
