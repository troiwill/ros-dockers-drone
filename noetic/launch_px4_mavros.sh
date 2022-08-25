#!/bin/bash

source setup_ros.sh
source setup_px4.sh

# connect to local port 14551 which voxl-vision-px4 uses for local comms with mavros
roslaunch mavros px4.launch fcu_url:=udp://127.0.0.1:14551@:14551 tgt_system:=${PX4_SYS_ID}
