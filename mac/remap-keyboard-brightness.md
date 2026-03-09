# Remap Keyboard Brightness

### Install
This LaunchAgent remaps the Spotlight and Dictation keys on a Mac to keyboard
brightness decrement and increment respectively. Install the file to enable
this functionality:

```
mkdir -p ~/Library/LaunchAgents/
cat << EOF > ~/Library/LaunchAgents/com.wendt.KeyRemapping.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>com.wendt.KeyRemapping</string>
	<key>ProgramArguments</key>
	<array>
		<string>/usr/bin/hidutil</string>
		<string>property</string>
		<string>--set</string>
		<string>{"UserKeyMapping":[ { "HIDKeyboardModifierMappingSrc": 0xC00000221, "HIDKeyboardModifierMappingDst": 0xFF00000009 }, { "HIDKeyboardModifierMappingSrc": 0xC000000CF, "HIDKeyboardModifierMappingDst": 0xFF00000008 } ]}</string>
	</array>
	<key>RunAtLoad</key>
	<true/>
</dict>
</plist>
EOF
```
