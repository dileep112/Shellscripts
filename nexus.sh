#!/bin/bash

sudo yum update -y

yum install java-1.8.0-openjdk-devel -y

yum install wget tar -y

# Set the desired Nexus version
NEXUS_VERSION="3.37.0-01"

# Download the Nexus installation package
wget "https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz"

# Extract the downloaded archive
tar -zxvf nexus-${NEXUS_VERSION}-unix.tar.gz -C /opt/

# Rename the extracted directory for convenience
mv /opt/nexus-${NEXUS_VERSION} /opt/nexus

# Create a Nexus user
sudo useradd -M -s /sbin/nologin nexus
sudo chown -R nexus:nexus /opt/nexus

# Configure Nexus to run as a service
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo chkconfig --add nexus
sudo chkconfig nexus on

# Start the Nexus service
sudo service nexus start

echo "Nexus ${NEXUS_VERSION} has been installed and started."
