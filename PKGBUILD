# Contributor: Ayaka Mikazuki <ayaka@mail.shn.hk>
# Maintainer: tee < teeaur at duck dot com >

pkgname=grain-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL-3.0-only')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source_x86_64=("grain-$pkgver::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums_x86_64=('5a6a8bbb59a0ad077b4b889fab2577d4cf12d026225cfa51e47c807329406880')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 "grain-$pkgver" "$pkgdir/usr/bin/grain"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
