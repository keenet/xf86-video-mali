echo "Copyting /include/ump/* to /usr/include/ump"
echo "Running autoreconf"
autoreconf -vi
echo "Configuring with /usr as prefix"
./configure --prefix=/usr --x-includes=/usr/include --x-libraries=/usr/lib
echo "Compiling"
make
echo "Installing"
make install
echo "Copying xorg.conf to right place where it belongs"
cp xorg.conf /usr/share/X11/xorg.conf.d/99-mali400.conf
echo "Changing /dev/mali and /dev/ump access once"
chmod 0777 /dev/mali
chmod 0777 /dev/ump
echo "Copyting 10-mali400.rules to udev so you dont need to change access each boot"
cp 10-mali400.rules /etc/udev/rules.d/10-mali400.rules
echo "Now you can restart your X server"

#echo "Restarting lightdm"
#service lightdm restart
