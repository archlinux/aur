# Maintainer: epitron <chris@ill-logic.com>
pkgname=codecvisa-bin
pkgver=4.36
pkgrel=1
pkgdesc="A tool for inspecting and analyzing raw H264/H265/VP8/VP9/etc video streams (at frame and macroblock levels) for fine tuning encodes."
url='http://www.codecian.com/'
license=('custom')
arch=('i686' 'x86_64')
source=("http://www.codecian.com/downloads/codecvisa.tar.gz")
sha256sums=("5fdc91d42f5d02dff6fcb29b02f160b432df58886fdaed7fbc4fc1aa8c83d59d")

package() {
  install -d $pkgdir/opt
  cp -r $srcdir/codecvisa $pkgdir/opt

  install -d $pkgdir/usr/bin
  ln -s ../../opt/codecvisa/codecvisa "$pkgdir"/usr/bin/codecvisa
}
