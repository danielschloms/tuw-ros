
ws00/src/gazebo_ros_pkgs:
		git clone -b ros2 git@github.com:tuw-robotics/gazebo_ros_pkgs.git $@
		touch $@/COLCON_IGNORE

ws00/src/teleop_tools:
		git clone -b foxy-devel git@github.com:ros-teleop/teleop_tools.git $@
		touch $@/COLCON_IGNORE

ws00/src/slam_toolbox:
		git clone -b humble git@github.com:SteveMacenski/slam_toolbox.git $@
		touch $@/COLCON_IGNORE

ws00/src/navigation2:
		git clone -b humble git@github.com:ros-planning/navigation2.git $@
		touch $@/COLCON_IGNORE

ws01/src/tuw_gazebo:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_gazebo.git $@
		
ws01/src/Stage:
		git clone -b ros2 git@github.com:tuw-robotics/Stage.git $@

ws01/src/stage_ros2:
		git clone -b humble git@github.com:tuw-robotics/stage_ros2.git $@

ws01/src/tuw_json:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_json.git $@

ws01/src/tuw_msgs:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_msgs.git $@

ws01/src/tuw_debug:
		git clone git@github.com:tuw-robotics/tuw_debug.git $@

ws01/src/marker_msgs:
		git clone -b ros2 git@github.com:tuw-robotics/marker_msgs.git $@

ws01/src/tuw_marker_detection:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_marker_detection.git $@

ws01/src/tuw_fake_localization:
		git clone -b main git@github.com:tuw-robotics/tuw_fake_localization.git $@

ws01/src/tuw_rviz:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_rviz.git $@

ws01/src/tuw_geometry:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_geometry.git $@

ws01/src/tuw_common:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_common.git $@

ws02/src/tuw_nav2:
		git clone -b main git@github.com:tuw-robotics/tuw_nav2.git $@

ws02/src/tuw_graph:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_graph.git $@

ws02/src/tuw_planner:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_planner.git $@

clone-ws00: \
	ws00/src/teleop_tools \
	ws00/src/slam_toolbox \
	ws00/src/navigation2 \
	ws00/src/gazebo_ros_pkgs

clone-ws01: \
	ws01/src/Stage \
	ws01/src/stage_ros2  \
	ws01/src/marker_msgs  \
	ws01/src/tuw_gazebo \
	ws01/src/tuw_geometry \
	ws01/src/tuw_msgs \
	ws01/src/tuw_json \
	ws01/src/tuw_common \
	ws01/src/tuw_rviz \
	ws01/src/tuw_debug \
	ws01/src/tuw_fake_localization

clone-ws02: \
	ws02/src/tuw_nav2 \
	ws02/src/tuw_graph \
	ws02/src/tuw_planner  

clone: clone-ws00 clone-ws01 clone-ws02
