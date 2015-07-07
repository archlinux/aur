# Maintainer: Fanfurlio Farolfi <demolitions@gmail.com>
# Contributor: Bruno Aleci <brunoaleci@gmail.com>
pkgname=isl3890-firmware
pkgver=2.13.25.0
pkgrel=3
pkgdesc="'softmac' firmware for the 3Com 3CRWE154G72 wireless chipset (and others)"
arch=('i686' 'x86_64')
url="http://wireless.kernel.org/en/users/Drivers/p54/devices"
license=('GPL')
source=("http://daemonizer.de/prism54/prism54-fw/fw-softmac/$pkgver.arm")
sha512sums=('efb19bec727c81cf72b529de5528a4cbede46b594c536a5829741e4b5ddcc54770cd0da3f0e787799b6bdeef587895bcc8bf23f8ce070074a6a87f61e7934792')

package() {
  mkdir -p $pkgdir/lib/firmware
  install -m644 * $pkgdir/lib/firmware/isl3886pci
}

# vim:set ts=2 sw=2 et:
