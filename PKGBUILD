# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=libweb
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple and lightweight web framework"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/libweb"
license=('AGPL2')
makedepends=('dynstr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b6e71cabd4d57141fe3d5049c445625aed4c9a6dde1601fafaf7cf5653882213a698ef25f814f5cc2b4f1e010b8e6a893fa77d8d6c8cb6f1bbbab8557ec3d3c6')

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  make prefix="$pkgdir/usr" install 
}

