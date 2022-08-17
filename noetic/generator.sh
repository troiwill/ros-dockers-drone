set -x

source /opt/ros/noetic/setup.bash
apt-get install -y libpoco-dev

rosinstall_generator class_loader --rosdistro noetic --deps --exclude RPP --wet-only --tar > additional.rosinstall
rosinstall_generator diagnostic_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator geographic_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator geometry2 --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator libmavconn --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator map_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator mavlink --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator mavros --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator mavros_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator nav_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator nodelet --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator nodelet_topic_tools --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator pcl_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator rosbag_migration_rule --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator rosconsole_bridge --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator serial --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator shape_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator stereo_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator tf --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator trajectory_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator uuid_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall
rosinstall_generator visualization_msgs --rosdistro noetic --deps --exclude RPP --wet-only --tar >> additional.rosinstall

wstool init -j8 src additional.rosinstall
rosdep install --from-paths src --ignore-src --rosdistro noetic -y -r
src/catkin/bin/catkin_make_isolated -j4 --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic
catkin_make_isolated -j1 --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic
