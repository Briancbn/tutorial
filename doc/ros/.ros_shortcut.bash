#!/usr/bin/env/ bash

## available ROS version and ws directory
avail_ros_distro="melodic dashing"
ws_dir="$HOME/Documents"

## rosout format 
export ROSCONSOLE_FORMAT='${node} [${severity}]: ${message}'

## Homing ros to workspace
roshome(){
    if roscd && [ "$ROS_WORKSPACE" == "" ]; then
        cd ../"$1"
    else
        cd "$1"
    fi
}

alias chrome_remote_desktop="google-chrome --app=https://remotedesktop.google.com/support"
alias change_default_gcc_ver="update-alternatives --config gcc"

srcros(){
    local srcmelodic="source /opt/ros/melodic/setup.bash"
    local srcrosver="source /opt/ros/$1/setup.bash"
    if [ $# -eq 0 ]; then
        $srcmelodic
        echo -e "\e[01;32m>>>Successfully source ROS Melodic by default.\e[0m"

    elif [ $# -eq 1 ]; then
        if $srcrosver; then
            echo -e "\e[01;32m>>>Successfully source ROS ${1^}.\e[0m"
        else
            $srcmelodic
            echo -e "\e[01;32m>>>Successfully source ROS melodic instead.\e[0m"
        fi

    elif [ $# -eq 2 ]; then
        if $srcrosver; then
            if [ -f $HOME/Documents/$2_ws/devel/setup.bash ]; then
                source $HOME/Documents/$2_ws/devel/setup.bash
                export ROS_WORKSPACE=$HOME/Documents/$2_ws/
                echo -e "\e[01;32m>>>Successfully source ROS ${1^} and ${2} workspace.\e[0m"
            elif [ -f $HOME/Documents/$2_ws/install/setup.bash ]; then
                source $HOME/Documents/$2_ws/install/setup.bash
                echo -e "\e[01;32m>>>Successfully source ROS ${1^} and ${2} workspace.\e[0m"

            else
                echo -e "\e[01;31mError: Wrong workspace name!!!\e[0m"
                echo -e "\e[01;32m>>>Successfully source ROS ${1^}.\e[0m"
            fi
        fi
    else
        echo -e "\e[01;31mError: Wrong num of params!!"
        $srcmelodic
        echo -e "\e[01;32m>>>Successfully source ROS Melodic by default.\e[0m"
    fi
}

_srcros_completions(){
    if [ "${#COMP_WORDS[@]}" -eq "2" ]; then
        COMPREPLY=($(compgen -W "${avail_ros_distro}" "${COMP_WORDS[1]}"))
        return
    fi
    local ws_suggestions=$(ls $ws_dir | sed "s/\t/\n/" | grep _ws | sed "s/_ws//" | sed "s/\n/\ /")
    if [ "${#COMP_WORDS[@]}" -eq "3" ]; then
        COMPREPLY=($(compgen -W "${ws_suggestions}" "${COMP_WORDS[2]}"))
    fi
}

alias rosdep_install_all="rosdep install --from-paths src --ignore-src -y"

complete -F _srcros_completions srcros
