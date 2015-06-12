# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=ponymenu
pkgver=1.2.1
pkgrel=1
pkgdesc="Quick terminal based application menu"
arch=('any')
url="https://github.com/maandree/ponymenu"
license=('GPL3')
depends=('python>=3')
provides=($pkgname)
conflicts=($pkgname)
source=("$url/tarball/$pkgver")
sha256sums=(5e541b1deaafa0fa226a2a0e9b8dd6f252cee057d50ff230e4cfbafa1c8843ec)

build() {
  cd maandree-${pkgname}-*
  make -B DESTDIR="$pkgdir/"
}

package() {
  cd maandree-${pkgname}-*
  make DESTDIR="$pkgdir/" install
}
