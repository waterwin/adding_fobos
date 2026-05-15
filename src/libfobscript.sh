#! /bin/bash

#script to consolidate all steps for installing libfobos in preparation of ka9q-radio

#a good start
sudo apt update && sudo apt upgrade -y

# make sure we are indeed in the user dir
cd ~

#dependencies
sudo apt -y install cmake git libusb-1.0-0-dev pkg-config

#verify installed version of libusb
dpkg -l | grep libusb

#get the source code from github // verify if we can use the latest or should do v2.3.1 as that works with my older pcb version of the Fobos SDR
git clone https://github.com/rigexpert/libfobos.git

#setup the folders and go there
cd libfobos
mkdir build
cd build

#cmake
cmake ..
make
sudo make install

#run a test
./fobos_devinfo
#or two
./fobos_recorder

#step 1-4 from ka9q-radio step 2-3 from libfobos
sudo sed -i 's/TAG+="uaccess"/GROUP="plugdev"/' /etc/udev/rules.d/fobos-sdr.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo ldconfig

#when libfobos is installed correctly in 
#-- Installing: /etc/udev/rules.d/fobos-sdr.rules
#-- Installing: /usr/local/include/fobos.h
#-- Installing: /usr/local/lib/libfobos.so
#-- Installing: /usr/local/lib/pkgconfig/libfobos.pc
# ka9q-radio will pick this up and create a build including fobos capabilities

