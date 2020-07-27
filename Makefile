SRC := 60-keyboard.hwdb.alienware-M17xR3.patch
DEST := /lib/udev/hwdb.d/60-keyboard.hwdb

.PHONY: apply
apply: $(SRC)
	patch $(DEST) $(SRC)
	systemd-hwdb update
	udevadm control --reload-rules
	udevadm trigger

.PHONY: remove
remove:
	patch -R $(DEST) $(SRC) || rm /lib/udev/hwdb.d/60-keyboard.hwdb.rej
	systemd-hwdb update
	udevadm control --reload-rules
	udevadm trigger
