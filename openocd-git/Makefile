PREFIX=/opt/openocd-git

all: | openocd
	cd openocd; ./bootstrap
	cd openocd; CCACHE=none ./configure --prefix=$(PREFIX) --enable-maintainer-mode --disable-werror --enable-internal-libjaylink $(shell bash ./features.sh)
	$(MAKE) -C openocd

mac: | openocd
	cd openocd; ./bootstrap
	cd openocd; CCACHE=none ./configure --prefix=$(PREFIX) --enable-maintainer-mode --disable-werror --disable-parport --disable-parport-ppdev --disable-doxygen-html $(shell bash ./features_mac.sh)
	$(MAKE) -C openocd

openocd:
	git clone --recurse-submodules https://repo.or.cz/openocd.git openocd
	cd openocd; patch -p1 < ../../0001-Extend-bank1-and-enable-bank2-of-STM32H7B0VBTx.patch

install:
	$(MAKE) -C openocd install
# udev rules
	install -D -m 0644 -t $(DESTDIR)/lib/udev/rules.d udev/*

clean:
	rm -rf openocd

