for m in *.iso
do
	if [ "$m" = "*.iso" ]; then
		break
	else
		echo -e "\nFound $m"
		dd=`hdiutil attach "$m" | cut -f3`
		echo -e "\nFound ${m%%.*} - $dd"
		cp -a "$dd"/ .
		if [ $? -ne 0 ]; then
			exit 10
		else
			hdiutil detach "$dd"
			rm -rf "$m"
		fi
	fi
done
