# Contributor: Ayaka Mikazuki <ayaka@mail.shn.hk>
# Maintainer: tee < teeaur at duck dot com >

pkgname=grain-bin
pkgver=0.7.3
pkgrel=1
pkgdesc='A modern web staple. A new language that puts academic language features to work'
arch=('x86_64')
url='https://grain-lang.org'
_git='https://github.com/grain-lang/grain'
license=('LGPL-3.0-or-later')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source_x86_64=("grain-$pkgver-x64.tgz::$_git/releases/download/grain-v$pkgver/grain-linux-x64.tar.gz")
sha256sums_x86_64=('0a62fd9ae4b24c6fbd365717396246049ede0a88702c9c975b06e5070a2304c7')
options=(!strip)

package() {
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
