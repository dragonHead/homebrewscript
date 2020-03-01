# mac brew install script #

### brewUpgrade.sh&nbsp;&nbsp;launchctl&nbsp;&nbsp;setting

1. editing brew.upgrade.plist
- copy brew.upgrade.plist
  ```
  cp ./brew.upgrade.plist ~/Library/LaunchAgents/brew.upgrade.plist
  ```
- launchctl load
```
launchctl load ~/Library/LaunchAgents/brew.upgrade.plist
```
