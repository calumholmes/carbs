# CARBS Install Script! (Minor changes to Luke Smiths LARBS)

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURECE[0]}")" &> /dev/null && pwd)

echo "Appending "Autumn" theme to ~/.config/x11/xresources"
echo "Note: This assumes you have not already altered the xresources file."
cat autumntheme >> ~/.config/x11/xresources
echo "Making theme available on startup"
cp -f xprofile ~/.config/x11/xprofile

echo 'Replacing "sysact"'
cp -f sysact ~/.local/bin/sysact

echo "Replacing dwmblocks config"
cp -f config.h ~/.local/src/dwmblocks/config.h
cd ~/.local/src/dwmblocks/
sudo make install
cd $SCRIPT_DIR

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
cp -f bg.jpg ~/Pictures/bg.jpg
setbg ~/Pictures/bg.jpg

echo "Done! Welcome to CARBS!"
echo 'Please renew dwm by pressing super+backspace and selecting "Renew dwm"'
echo "By the way you can delete this folder now."
