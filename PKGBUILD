# Maintainer: S.Leduc <sebastien@sleduc.fr>
# Contributor: Jaroslav Martinek <jamar@jamar.org>

pkgname=dvb-usb-af9035-fw
pkgver=0.2
pkgrel=2
pkgdesc="Firmware for Alfatech AF9035 based USB DVB-T sticks"
arch=('any')
url="http://www.linuxtv.org/wiki/index.php/DVB-T_USB_Devices"
license=('unknown')
source=("http://palosaari.fi/linux/v4l-dvb/firmware/af9035/dvb-usb-af9035-02.fw_14ae2b81bac90ff5c6b490c225265267_12.13.15.0_6.20.15.0")
md5sums=("14ae2b81bac90ff5c6b490c225265267")

package() {
  fwfile=`ls $srcdir/*`
  fwfile=`basename $fwfile`
  install -d "${pkgdir}"/usr/lib/firmware
  install -D -m644 "${srcdir}/${fwfile}" "${pkgdir}"/usr/lib/firmware/${fwfile/_*/}
}

# vim:set ts=2 sw=2 et:
