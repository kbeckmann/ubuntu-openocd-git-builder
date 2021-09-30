#!/bin/bash

# Taken from openocd-git from AUR

_features=(
    aice
    armjtagew
    buspirate
    cmsis-dap
    dummy
    ftdi
    ioutil
    jlink
    jtag_vpi
    legacy-ft2232_libftdi
    oocd_trace
    opendous
    openjtag_ftdi
    osbdm
    presto_libftdi
    remote-bitbang
    rlink
    stlink
    ti-icdi
    ulink
    usb-blaster-2
    usb_blaster_libftdi
    usbprog
    vsllink
    )

echo ${_features[@]/#/--enable-}
