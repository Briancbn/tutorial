# IDE ROS
## Vim with YCM (YouCompleteMe)
  Put the sample [.ycm_extra_conf.py]() inside the `<workspacename>_ws/` folder. When you compile your workspace remember to run the following command first.
  ```
catkin config --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
  ```
