#!/bin/bash

source /opt/ros/${ROS_DISTRO}/setup.bash
unset ROS_HOSTNAME

# ROS master IP refers to the computer that run the roscore or ros master.
export ROS_MASTER_IP=192.168.78.142
export ROS_MASTER_URI=http://${ROS_MASTER_IP}:11311/

# ROS IP is the IP address of this computer.
export ROS_IP=192.168.78.224
