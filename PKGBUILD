 # Maintainer: Mickael Bosch <mickael dot bosch at linux dot com>
pkgname='zegrapher'
pkgver=3.1
pkgrel=1
arch=('x86_64')
url="http://www.zegrapher.com"
makedepends=()
license=('GPL')
pkgdesc="mathematical objects plotting software"
depends=(qt5-base)
conflicts=(zegrapher)
source=("https://github.com/AdelKS/ZeGrapher/archive/v3.1.tar.gz")
md5sums=('f6099bea1d4787702a0d67705e2c3dc3')

build() {
  cd "ZeGrapher-$pkgver"
  qmake
  make
}

package() {
  cd "ZeGrapher-$pkgver"
  install -Dm755 ZeGrapher "$pkgdir"/usr/bin/ZeGrapher
  install -Dm644 ZeGrapher.ico "$pkgdir"/usr/share/pixmaps/ZeGrapher.ico
} 
