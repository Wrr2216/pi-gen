#!/bin/bash


# Create the scripts folder in the root filesystem if it doesn't exist
mkdir -p "${ROOTFS_DIR}/scripts/"

# Download the file
wget http://millercyber.tech/ccfd/files/display.sh -O "${ROOTFS_DIR}/scripts/display.sh"

# Give execute permission to the script
chmod +x "${ROOTFS_DIR}/scripts/display.sh"

# Add the script to the startup file
sudo sh -c 'echo "sh ${ROOTFS_DIR}/scripts/display.sh &" >> /etc/rc.local'

# Make the startup file executable
sudo chmod +x /etc/rc.local


line="*/5 * * * * ${ROOTFS_DIR}/scripts/display.sh"
(crontab -l; echo "$line" ) | crontab -

wget http://millercyber.tech/ccfd/files/heartbeat.sh -0 "${ROOTFS_DIR}/scripts/"
chmod +x "${ROOTFS_DIR}/scripts/heartbeat.sh"
