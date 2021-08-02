tar -xf /home/pi/droidcam-raspberrypi-auto-install/libjpeg-turbo-2.1.0.tar.gz 
sudo cp -r libjpeg-turbo-2.1.0 /tmp 
git clone https://github.com/dev47apps/droidcam/ 
cd /tmp 
cd libjpeg-turbo-2.1.0 
cmake -G "Unix Makefiles" 
make 
sudo make install 
sudo make deb 
sudo dpkg -i libjpeg-turbo_2.1.0_armhf.deb
sudo apt install raspberrypi-kernel-headers 
sudo apt install libavutil-dev 
sudo apt install libswscale-dev 
sudo apt install libasound2-dev 
sudo apt install libspeex-dev 
sudo apt install libusbmuxd-dev 
sudo apt install gtk+-3.0 
sudo apt install libappindicator3-dev 
cd /home/pi 
cd droidcam-raspberrypi-auto-install 
make droidcam-cli 
make droidcam 
sudo ./install-client 
sudo ./install-video 
echo The Installation has completed..use "sudo ./droidcam" to launch droidcam 
exit




