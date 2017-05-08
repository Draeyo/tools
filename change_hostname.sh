# For OSX only
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sed -i -e 's/'$HOSTNAME'/'$1'/g' /etc/hostname
elif [[ "$OSTYPE" == darwin* ]]; then
	# Mac OSX
	sudo scutil --set ComputerName $1
	sudo scutil --set LocalHostName $1
	sudo scutil --set HostName $1
	echo "Hostname changed from $HOSTNAME to $1."
	dscacheutil -flushcache
	echo "Reboot..."
	sleep 2
	sudo reboot
elif [[ "$OSTYPE" == "cygwin" ]]; then
	# POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
	# Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
	# I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd*" ]]; then
	# ...
else
	echo "System not supported..."
fi
