# used in vscode tasks to source only workspaces up to the building workspace
echo "** ROS2 $ROS_DISTRO initialized with $RMW_IMPLEMENTATION **"
source_ws ${PROJECT_DIR}/ws00/install/setup.bash
source_ws ${PROJECT_DIR}/ws01/install/setup.bash
source_ws ${PROJECT_DIR}/ws02/install/setup.bash
source_ws ${PROJECT_DIR}/ws_kronecker/install/setup.bash
