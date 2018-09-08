# README #

### brewUpgrade.sh&nbsp;&nbsp;launchctl&nbsp;&nbsp;setting

1. editing brew.upgrade.plist
- create launchd.conf
  ```
  $ sudo vi /etc/launchd.conf
  ```
  ```
  setenv PATH /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
  ```
- copy brew.upgrade.plist
  ```
  cp ./brew.upgrade.plist ~/Library/LaunchAgents/brew.upgrade.plist
  ```
- launchctl load 
```
launchctl load ~/Library/LaunchAgents/brew.upgrade.plist
```
