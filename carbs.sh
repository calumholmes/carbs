# CARBS Install Script! (Minor changes to Luke Smiths LARBS)

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURECE[0]}")" &> /dev/null && pwd)

# Theming
echo "What theme do you want?"
echo "1. Autumn, 2. Petals, 3. Slate"
echo -n "Choose: "
read themechoice

mkdir ~/CARBS_Files
mkdir ~/CARBS_Files/Wallpapers
case $themechoice in
1)
	echo "Replacing ~/.config/x11/xresources"
	cp -f autumntheme ~/.config/x11/xresources
	echo "Setting background"
	cp autumnbg.jpg ~/CARBS_Files/Wallpapers
	setbg ~/CARBS_Files/Wallpapers/autumnbg.jpg
	;;
2)
	echo "Replacing ~/.config/x11/xresources"
	cp -f petalstheme ~/.config/x11/xresources
	echo "Setting background"
	cp petalsbg.jpg ~/CARBS_Files/Wallpapers

	setbg ~/CARBS_Files/Wallpapers/petalsbg.jpg
	;;
3)
	echo "Replacing ~/.config/x11/xresources"
	cp -f slatetheme ~/.config/x11/xresources
	echo "Setting background"
	cp slatebg.jpg ~/CARBS_Files/Wallpapers
	setbg ~/CARBS_Files/Wallpapers/slatebg.jpg
	;;
*)
	echo "Not valid. Skipping..."
esac

echo "Making theme available on startup"
cp -f xprofile ~/.config/x11/xprofile

echo 'Replacing "sysact"'
cp -f sysact ~/.local/bin/sysact

echo "Replacing dwmblocks config"
cp -f config.h ~/.local/src/dwmblocks/config.h
cd ~/.local/src/dwmblocks/
sudo make install
cd $SCRIPT_DIR

echo "Installing geoip"
sudo pacman -S --noconfirm geoip

echo "Replacing old dwmblock modules"
cp -f sb-volume ~/.local/bin/statusbar/
cp -f sb-cpu ~/.local/bin/statusbar/
cp -f sb-memory ~/.local/bin/statusbar/
cp -f sb-battery ~/.local/bin/statusbar/
cp -f sb-internet ~/.local/bin/statusbar/
cp -f sb-clock ~/.local/bin/statusbar/
cp -f sb-iplocate ~/.local/bin/statusbar/

echo "Finishing up theming..."
xrdb ~/.config/x11/xresources

echo "Do you want to add this logo on startup? (Artix only)"
cat carbs.txt
echo -n "Add the CARBS motd on startup? Say now if you've aready done it. (Y/n): "
read askmotd
case $askmotd in
	y)
		mkdir "/home/$(whoami)/CARBS_Files/MOTD"
		runcommand="sh /home/$(whoami)/CARBS_Files/MOTD/motd.sh"
		echo "$runcommand"
		touch "/home/$(whoami)/CARBS_Files/MOTD/runmotd"
		sudo echo $runcommand > "/etc/rc.local"
		cat "/home/$(whoami)/CARBS_Files/MOTD/runmotd"
		cp -f motd.sh /home/$(whoami)/CARBS_Files/MOTD/motd.sh
		echo "cat /home/$(whoami)/CARBS_Files/MOTD/carbs.txt" >> motd.sh
		cp -f carbs.txt /home/$(whoami)/CARBS_Files/MOTD/carbs.txt
		;;
	*)
		echo "oops"
		;;
esac

echo "Done! Welcome to CARBS!"
echo 'Please renew dwm by pressing super+backspace and selecting "Renew dwm"'
echo "By the way you can delete this folder now."
