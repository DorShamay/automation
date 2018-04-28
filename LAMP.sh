#!/bin/bash
#Creator : DorShamay
#Porpuse : Installing LAMP server
#Version : 1.2.1


# Check if user is root
checkroot()
{
if [ $(id -u) != "0" ]; then
		echo "You are not root , Exiting"
		exit 1;
	fi
}


mainmenu()
{

echo "Which distro you running?"
select func in "Centos-RedHat" "Debian/Ubuntu" "ArchLinux" "Quit"
	do
		case $func in
			"Centos-RedHat")
		Webmenured
		  printf "\n"
		  printf "\n"
		mainmenu
			;;
			"Debian/Ubuntu")
		Welcomedeb
		Webmenudeb
		Sequellmenudeb
		PhpPearldeb
			;;
			"ArchLinux")
		archlinux
		  printf "\n"
		  printf "\n"
		mainmenu
			;;
			"Quit" | "q")
		exit 0
			;;
				*)
					echo "Please enter a Valid selection"
			;;
		esac
	done
}

welcomedeb()
{
	#Warming welcome to the LAMP Server installation of Debian
echo "------------------------------------------"
echo "Welcome to Debian LAMP Server Installation"
echo "------------------------------------------"
}
Apaches()
{
# Installing apache2 (WebServer)
	apt-get install -y apache2
	if [[ $? = 0 ]]; then
		echo "Install successfully"
	else
		echo "Install unsuccessfully"
	fi
echo "Would you like to add a rule for your firewall?"
select fire in "Yes" "No"
	case $fire in
		Yes)
	firewall-cmd --add-service=http --permanent
	firewall-cmd --reload
		;;
		No)
	echo "You can always put the rule , Keep on going ... "
		;;
		*)
		 echo "Please enter a Valid Selection"
}

Ngnixs()
{
#Installing Ngnix (Webserver)
	echo "Before Installing Ngnix on Deb/Ubuntu You'll need some repos of the package, Let me do it for you"
	echo deb http://nginx.org/packages/ubuntu/ >> /etc/apt/sources.list
	echo deb-src http://nginx.org/packages/ubuntu/ >> /etc/apt/sources.list
	echo "As we all know we need to update the repos after adding new ones"
		apt-get update
		apt-get install -y ngnix
		if [[ $? = 0 ]]; then
			echo "Install successfully"
		else
			echo "Install unsuccessfully"
		fi
		sleep 2
		echo "Would you like to add a rule for your firewall?"
		select fire in "Yes" "No"
			case $fire in
				Yes)
			firewall-cmd --add-service=http --permanent
			firewall-cmd --reload
				;;
				No)
			echo "You can always put the rule , Keep on going ... "
				;;
				*)
				 echo "Please enter a Valid Selection"}
}
#Menu of the installation of Webservers
Webmenudeb()
{
echo "Which webserver you want to install?"
select Webserv in  "Apache2" "Ngnix" "Quit"
	do
		case $Webserv in
		"Apache2")
			Apaches
	  		printf "\n"
	  		printf "\n"
					;;
		"Ngnix")
			Ngnixs
	  		printf "\n"
	  		printf "\n"
					;;
		"Quit")
				exit 0
					;;
			*)
				echo "Please enter Valid Selection"
					;;
		esac
	done

{

#SQL Server
Sequellmenudeb()
{

echo "Which SQL Server would you like to install?"
	select Sql in "MariaDB" "PostgreSQL" "Quit"
		do
			case $Sql in
			"MariaDB")
					Mariadbs
						printf "\n"
						printf "\n"
						;;
				"PostgreSQL")
						Postgresqls
						printf "\n"
						printf "\n"
						;;
				"Quit")
						exit 0
						;;
					*)
							echo "Please enter Valid selection"
				;;
			esac
		done
}

Mariadbs()
{
#Installing MariaDB
	apt-get install -y mariadb-server
  if [[ $? = 0 ]]; then
      echo "Install successfully"
  else
      echo "Install unseccessfully"
  fi
	echo "Would you like to install MariaDB client aswell? Yes/No "
	select inst in "Yes" "No" "Quit"
	 do
	  case $inst
			"Yes")
	     apt-get install mariadb-client
	    ;;
	    "No")
	     echo "No worries you can always download it"
	    ;;
	    "Quit")
	     break
	    ;;
	    *)
	     echo "Please enter a valid selection"
	    ;;
	 esac
	done
}

Postgresqls()
{
#Installing Postgresql
	apt-get install -y postgresql
	if [[ $? = 0 ]]; then
		echo "Install successfully"
	else
		echo "Install unseccessfully"
	fi
	sleep 1
}
PhpPearldeb()
{
	echo "Which PHP Service would you like to install?"
		select script in "Php" "Pearl" "Quit"
			do
				case $script in
				"Php")
					Phpdeb
							;;
				"Pearldeb")
					Perldeb
							;;
					"Quit")
							break
							;;
						*)
								echo "Please enter Valid selection"
					;;
				esac
			done

}

Phpdeb()
{
 echo "Welcome to PHP Installer for debian"
 apt-get install -y php
	if [[ $? = 0 ]]; then
		echo "Installation successfully"
	else
		echo "Installation unsuccessfully"
	fi
	sleep 1
}

Perldeb()
{
echo "Welcome to Perl Installer for Pearl"
apt-get install -y perl perl-doc
  if [[ $? = 0 ]]; then
		echo "Installation successfully"
	else
		echo "Installation unsuccessfully"
	fi
	sleep 1
}

Welcomered()
{
echo "------------------------------------------"
echo "Welcome to Centos LAMP Server Installation"
echo "------------------------------------------"
}
Webmenured()
{
 echo "Welcome to WebServer Installation for Centos"
 select Webserv in  "Apache2" "Ngnix" "Quit"
 	do
 		case $Webserv in
 		"Apache2")
 			Apahchered
 					;;
 		"Ngnix")
 			Ngnixred
 					;;
 		"Quit")
 				break
 					;;
 			*)
 				echo "Please enter Valid Selection"
 					;;
 		esac
 	done
}

Apahchered()
{
	yum -y install httpd
	 if [[ $? = 0 ]]; then
		 echo "Installation successfully"
	 else
		 echo "Installation unsuccessfully"
	fi
	sleep 1
	echo "Would you like to add a rule for your firewall?"
	select fire in "Yes" "No"
		case $fire in
			Yes)
		firewall-cmd --add-service=http --permanent
		firewall-cmd --reload
			;;
			No)
		echo "You can always put the rule , Keep on going ... "
			;;
			*)
			 echo "Please enter a Valid Selection"
}

Ngnixred()
{
yum --enablerepo=epel -y install ngnix
 if [[ $? = 0 ]]; then
	 echo "Installationb successfully"
 else
	 echo "Installation unsuccessfully"
 fi
 sleep 1
 echo "Would you like to add a rule for your firewall?"
 select fire in "Yes" "No"
 	case $fire in
 		Yes)
 	firewall-cmd --add-service=http --permanent
 	firewall-cmd --reload
 		;;
 		No)
 	echo "You can always put the rule , Keep on going ... "
 		;;
 		*)
 		 echo "Please enter a Valid Selection"
}


checkroot
mainmenu
