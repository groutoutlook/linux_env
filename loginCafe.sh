



adb shell " monkey -p org.mozilla.firefox -v 1 \
	&& sleep 1 \
	&& input tap 300 1450 \
	&& input text '10.5.50.1' \
	&& input keyevent KEYCODE_ENTER"




