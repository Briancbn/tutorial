# Linux Random stuff
## Summary
[How to Fix System Program Problem Detected in Ubuntu](#how-to-fix-system-program-problem-detected-in-ubuntu)

## Contents
### How To Fix System Program Problem Detected In Ubuntu
  - To view the specific crash reports:
    ```
    ls -l /var/crash/*
    ```
  - If you don't want previous crash reports to pop up after boot, you can run:
    ```
    sudo rm /var/crash/*
    ```
    to delete all the crash reports.
    
  - If you want to permanently get rid of system error pop up in Ubuntu, you can open `/etc/default/apport` with your favorite editor
  with root access. The content in the file will be similar as below:
    ```
    # set this to 0 to disable apport, or to 1 to enable it
    # you can temporarily override this with
    # sudo service apport start force_start=1
    enabled=1
    ```
    Change `enabled=1` to `enable=0` to disable system error pop up and vice versa.
  
  (References: https://itsfoss.com/how-to-fix-system-program-problem-detected-ubuntu/).
