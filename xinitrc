#!/bin/bash 

# load PT keyboard
setxkbmap -layout pt 

# load .Xresources
xrdb -load .suckless/dotfiles/Xresources

# change CAPS to ESC
xmodmap -e 'clear lock' # Ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' # Remaps the keyboard so CAPS LOCK = ESC

# set background image
#feh --bg-scale ".suckless/backgrounds/dark0.png"

# when plugged
while true;
do
	# battery
	bat=$(acpi | grep "Battery 1" | cut -d" " -f4 | cut -d"," -f1)
	batstatus=$(acpi | grep "Battery 1" | cut -d" " -f3 | cut -d"," -f1)
	if [[ "$batstatus" == "Discharging" ]];
	then
		baticon=$(echo -e "\uf242")
	else
		baticon=$(echo -e "\uf1e6")
	fi
	# volume
	vol=$(amixer get Master | sed -n "5p" | cut -d" " -f6 | cut -d"]" -f1 | cut -d"[" -f2)		
	volstatus=$(amixer get Master | sed -n "5p" | cut -d" " -f8 | cut -d"]" -f1 | cut -d"[" -f2)		
	if [[ "$volstatus" == "on" ]];
	then
		volicon=$(echo -e "\uf028")
	else
		volicon=$(echo -e "\uf026")
	fi
	# network
	#ip=$(nmcli | sed -n "5p" | cut -d" " -f2 | cut -d"/" -f1)
	#ssid=$(nmcli | sed -n "1p" | cut -d" " -f4)
	wifi=$(ip a | grep wlp58s0 | grep "state UP")
	if [[ "$wifi" != "" ]];
	then
		ip=$(ip a | grep wlp58s0 | sed -n "2p" | cut -d" " -f6 | cut -d"/" -f1)
		ipicon=$(echo -e "\uf1eb")
	else
		ip=$(ip a | grep enp0s31f6 | sed -n "2p" | cut -d" " -f6 | cut -d"/" -f1)
		ipicon=$(echo -e "\uf0c1")
	fi
	if [["$ip" == ""]];
	then
		ip=$(echo -e "?")
	fi
	# print in status bar
	xsetroot -name "$volicon $vol $ipicon $ip $baticon $bat $(date +"%A %d.%m.%y %H:%M")"
	sleep 0.5
done&

# window manager
exec dwm
