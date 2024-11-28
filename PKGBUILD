# Contributor: Ayaka Mikazuki <ayaka@mail.shn.hk>
# Maintainer: tee < teeaur at duck dot com >

pkgname=grain-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('a55eb032a63d69c5a32d46cc6d6f9e32fa2fa872aab2254fcfde4b89e4408631')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
