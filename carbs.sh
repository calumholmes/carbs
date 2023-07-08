# CARBS Install Script! (Minor changes to Luke Smiths LARBS)

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURECE[0]}")" &> /dev/null && pwd)

# Theming
echo "What theme do you want?"
echo "1. Autumn, 2. Petals, 3. Slate"
echo -n "Choose: "
read themechoice

mkdir ~/Pictures

case $themechoice in
1)
	echo "Replacing ~/.config/x11/xresources"
	cp -f autumntheme ~/.config/x11/xresources
	echo "Setting background"
	cp autumnbg.jpg ~/Pictures/
	setbg ~/Pictures/autumnbg.jpg
	;;
2)
	echo "Replacing ~/.config/x11/xresources"
	cp -f petalstheme ~/.config/x11/xresources
	echo "Setting background"
	cp petalsbg.jpg ~/Pictures/
	setbg ~/Pictures/petalsbg.jpg
	;;
3)
	echo "Replacing ~/.config/x11/xresources"
	cp -f slatetheme ~/.config/x11/xresources
	echo "Setting background"
	cp slatebg.jpg ~/Pictures/
	setbg ~/Pictures/slatebg.jpg
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

echo "Replacing modified dwmblock modules"
cp -f sb-volume ~/.local/bin/statusbar/
cp -f sb-cpu ~/.local/bin/statusbar/
cp -f sb-memory ~/.local/bin/statusbar/
cp -f sb-battery ~/.local/bin/statusbar/
cp -f sb-internet ~/.local/bin/statusbar/
cp -f sb-clock ~/.local/bin/statusbar/
cp -f sb-iplocate ~/.local/bin/statusbar/

echo "Finishing up..."
xrdb ~/.config/x11/xresources

echo "Done! Welcome to CARBS!"
echo 'Please renew dwm by pressing super+backspace and selecting "Renew dwm"'
echo "By the way you can delete this folder now."
