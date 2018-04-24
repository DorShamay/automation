#!/bin/bash
#dorshamay
#0.0.2
#Install LAMP Server on few distros


source LAMP.sh
mainmenu()
{

echo "Which distro you running?"
select func in "Centos-RedHat" "Debian/Ubuntu" "ArchLinux" "Quit"
	do
		case $func in
			"Centos-RedHat" | "centos-redhat")
		centos
		  printf "\n"
		  printf "\n"
		mainmenu
			;;
			"Debian/Ubuntu" | "debian/ubuntu")
		debian/ubuntu
		  printf "\n"
		  printf "\n"
		webmenudeb
			;;
			"ArchLinux" | "archlinux")
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

checkroot
mainmenu
