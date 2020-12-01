PREFIX=/opt/openocd-git

all: | openocd
	cd openocd; ./bootstrap
	cd openocd; CCACHE=none ./configure --prefix=$(PREFIX) --enable-maintainer-mode --disable-werror $(shell bash ./features.sh)
	$(MAKE) -C openocd

openocd:
	git clone https://repo.or.cz/openocd.git openocd
	cd openocd

install:
	$(MAKE) -C openocd install
# udev rules
	install -D -m 0644 -t $(DESTDIR)/lib/udev/rules.d udev/*

clean:
	rm -rf openocd

