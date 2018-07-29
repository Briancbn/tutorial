# Dual Boot Ubuntu and Windows
## Summary
- [System Time Conflict](#system-time-conflict)
## Content
### System Time Conflict
- The most simple solution is to run: 
  ```
  timedatectl set-local-rtc 1
  ```
  Ubuntu 15.04 and above.
- For more explanation or better solution: https://help.ubuntu.com/community/UbuntuTime#Multiple_Boot_Systems_Time_Conflicts