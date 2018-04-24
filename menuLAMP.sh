#!/bin/bash
#dorshamay
#0.0.1
#Install LAMP Server on few distros


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
		mainmenu
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
mainmenu
