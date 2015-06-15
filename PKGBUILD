# Maintainer: Tomáš Mládek <tmladek [on] inventati [bop] org>

pkgname=3dslicer
pkgver=4.4.0
pkgrel=1
pkgdesc="A free, open source software package for image analysis and scientific visualization."
url="http://slicer.org"
arch=x86_64
license=(BSD)
source="http://download.slicer.org/bitstream/263262"
sha256sums=('9c538a975c0b0b2c47d45868d35be60c69a3c3e82222ca04470052f16d699a02')

package() {
  mkdir -p $pkgdir/opt
  mv Slicer-4.4.0-linux-amd64 $pkgdir/opt/3dslicer
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/3dslicer/Slicer $pkgdir/usr/bin
}