# Maintainer: epitron <chris@ill-logic.com>
pkgname=codecvisa-bin
pkgver=4.38
pkgrel=1
pkgdesc="A tool for inspecting and analyzing raw H264/H265/VP8/VP9/etc video streams (at frame and macroblock levels) for fine tuning encodes."
url='http://www.codecian.com/'
license=('custom')
arch=('i686' 'x86_64')
source=("http://www.codecian.com/downloads/codecvisa.tar.gz")
sha256sums=("35782a8aee8ef27d663e3fdad18ff266ccfdc319c04fcd984ce31abfc4e53966")

package() {
  install -d $pkgdir/opt
  cp -r $srcdir/codecvisa $pkgdir/opt

  install -d $pkgdir/usr/bin
  ln -s ../../opt/codecvisa/codecvisa "$pkgdir"/usr/bin/codecvisa
}
