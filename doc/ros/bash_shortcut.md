# My ROS Bash Shortcut
## 1. Installation
Usually after ROS installation, you are instructed to put `source /opt/ros/$ROS_DISTRO/setup.bash` at the end of your `.bashrc` file. However, with the development of ROS 2, you might want to **switch between different ROS version**. So here is a short bash script to help you do that. 

Delete the sourcing lines that were added into your `.bashrc`  file. Then run the following command to update the new bashrc as well as installing the bash script for the shortcuts.
```
wget https://raw.githubusercontent.com/Briancbn/tutorial/master/doc/ros/.ros_shortcut.bash
echo ". ~/.ros_shortcut.bash" >> ~/.bashrc
```
