#!/bin/bash

if (lsmod | grep v4l2loopback_dc); then
    echo "Removing video device"
    rmmod v4l2loopback_dc
    rm -f /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko
fi

echo "Removing files"
sudo rm -f /usr/bin/droidcam*
sudo rm -f /usr/local/bin/droidcam*
sudo rm -f /usr/share/applications/droidcam.desktop

etc_modules() {
	# Remove droidcam reference in /etc/modules
	cat /etc/modules | egrep -v "^(videodev|v4l2loopback_dc)" > /tmp/.etc.modules
	prevperm=`stat -c %a /etc/modules`
	sudo mv /tmp/.etc.modules /etc/modules
	sudo chmod $prevperm /etc/modules
}

echo "Cleaning configs"
[[ -e "/etc/modules" ]] && etc_modules
rm -f /etc/modprobe.d/droidcam.conf || true
rm -f /etc/modules-load.d/droidcam.conf || true
rm -f /opt/droidcam*
echo "Done"

#Thanks-to-oxmc
