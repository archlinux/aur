# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=libweb
pkgver=0.1.0
pkgrel=4
pkgdesc="A simple and lightweight web framework"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/libweb"
license=('AGPL2')
makedepends=('dynstr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('93d80463ae525407f6089cf9a45522070eb3c754e50ded16e2a3d5de1599107d7fa01b6f82f5fabdf5257faa82f0321b6ccd89da7b5725b925e1ef5492af6cde')

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  sudo make install prefix=/usr
}

