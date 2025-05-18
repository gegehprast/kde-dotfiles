#!/bin/sh

# Automatically connect to a VPN when the Ethernet interface is up
VPN_NAME="ROG"
E_DEVICE_NAME="eno1"
WIFI_DEVICE_NAME="wlan0"

interface=$1 action=$2

# Write to log
log_file="/var/log/vpn_auto_connect.log"

case $action in
  up|vpn-down)
    # Log up event
    echo "$(date): Interface $interface is up" >> "$log_file"

    # Check if the interface is the Ethernet device
    if [ $interface == $E_DEVICE_NAME ] ; then
      # Check if the VPN is already connected
      if ! nmcli connection show --active | grep "$VPN_NAME"; then
        # Log VPN connection attempt
        echo "$(date): Attempting to connect to VPN $VPN_NAME" >> "$log_file"

        # Connect to the VPN
        nmcli connection up "$VPN_NAME"
      fi
    fi
    ;;
  down)
    # Log down event
    echo "$(date): Interface $interface is down" >> "$log_file"

    # Check if the interface is the Ethernet device
    if [ $interface == $E_DEVICE_NAME ] ; then
      # Log VPN disconnection
      echo "$(date): Disconnecting VPN $VPN_NAME" >> "$log_file"
      
      # Disconnect from the VPN
      nmcli connection down "$VPN_NAME"
    fi
    ;;
esac
