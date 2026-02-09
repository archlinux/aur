# Contributor: Ayaka Mikazuki <ayaka@mail.shn.hk>
# Maintainer: tee < teeaur at duck dot com >

pkgname=grain-bin
pkgver=0.7.2
pkgrel=1
pkgdesc='A modern web staple. A new language that puts academic language features to work'
arch=('x86_64')
url='https://grain-lang.org'
_git='https://github.com/grain-lang/grain'
license=('LGPL-3.0-only')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source_x86_64=("grain-$pkgver::$_git/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums_x86_64=('82658891d33f5431e7bd260f0c00b8e86c43eb9182c5327f41db25d60b54dadd')
options=(!strip)

package() {
  install -Dm755 "$srcdir/grain-$pkgver" "$pkgdir/usr/bin/grain"
}
