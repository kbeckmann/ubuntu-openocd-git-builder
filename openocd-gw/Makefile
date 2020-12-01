OPENOCD_VERSION=4c364b453488fb5d30c32dfb4f294c30d255d7bf

PREFIX=/opt/openocd-gw

all: | openocd/.patched
	cd openocd; ./bootstrap
	cd openocd; CCACHE=none ./configure --verbose --disable-verbose-usb-io --disable-verbose-usb-comms --enable-ftdi --enable-stlink --enable-jlink --enable-rlink --enable-ti-icdi --enable-cmsis-dap --enable-maintainer-mode --prefix=$(PREFIX)
	$(MAKE) -C openocd

openocd:
	git clone https://git.code.sf.net/p/openocd/code openocd
	cd openocd; git checkout $(OPENOCD_VERSION)

game-and-watch-backup:
	git clone https://github.com/ghidraninja/game-and-watch-backup.git game-and-watch-backup

openocd/.patched: | openocd game-and-watch-backup
#	cd openocd; git apply ../somedir/patches/somepatch.diff

install:
	$(MAKE) -C openocd install
# Copy custom start scripts
	install -D -m 0755 -t $(DESTDIR)/usr/bin game-and-watch-backup/scripts/flashloader.sh
# Copy custom board files
	install -D -m 0644 -t $(DESTDIR)$(PREFIX)/share/openocd/scripts/board game-and-watch-backup/openocd/flash.cfg
	install -D -m 0644 -t $(DESTDIR)$(PREFIX)/share/openocd/scripts/board game-and-watch-backup/openocd/flash_jlink.cfg
	install -D -m 0644 -t $(DESTDIR)$(PREFIX)/share/openocd/scripts/board game-and-watch-backup/openocd/flash_stlink.cfg
	install -D -m 0644 -t $(DESTDIR)$(PREFIX)/share/openocd/scripts/board game-and-watch-backup/openocd/interface_jlink.cfg
	install -D -m 0644 -t $(DESTDIR)$(PREFIX)/share/openocd/scripts/board game-and-watch-backup/openocd/interface_stlink.cfg
# udev rules
	install -D -m 0644 -t $(DESTDIR)/lib/udev/rules.d udev/*

clean:
	rm -rf openocd
	rm -rf game-and-watch-backup

