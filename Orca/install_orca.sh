#!/bin/bash
echo `start install orca in ubuntu`
apt-get install -y python3 python3-pip xvfb fuse wget vim
wget https://github.com/plotly/orca/releases/download/v1.2.1/orca-1.2.1-x86_64.AppImage
mv orca-1.2.1-x86_64.AppImage ./home/orca-1.2.1-x86_64.AppImage
chmod +x orca-1.2.1-x86_64.AppImage
/home/orca-1.2.1-x86_64.AppImage --appimage-extract
printf '#!/bin/bash \nxvfb-run --auto-servernum --server-args "-screen 0 640x480x24" /squashfs-root/app/orca "$@"' > /usr/bin/orca
chmod +x /usr/bin/orca
apt-get install libgtk2.0-0 libgconf-2-4 libxtst6 libxss1 libnss3-dev libasound2

echo `install python modul for plotly using orca`
pip3 install plotly psutil requests

echo `Install Finish!`