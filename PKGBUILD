# Contributor: Ayaka Mikazuki <ayaka@mail.shn.hk>
# Maintainer: tee < teeaur at duck dot com >

pkgname=grain-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL-3.0-only')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source_x86_64=("grain-$pkgver::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums_x86_64=('4df389f04077c080e29a88d79a4168db8ed6f78b9d23ea0857985c0bddfbd778')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 "grain-$pkgver" "$pkgdir/usr/bin/grain"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
