 # Maintainer: Mickael Bosch <mickael dot bosch at linux dot com>
pkgname='zegrapher'
pkgver=3.0.2
pkgrel=1
arch=('x86_64')
url="http://www.zegrapher.com"
makedepends=()
license=('GPL')
pkgdesc="mathematical objects plotting software"
depends=(qt5-base)
conflicts=(zegrapher)
source=("https://github.com/AdelKS/ZeGrapher/archive/v3.0.2.tar.gz")
md5sums=('a8440300bbf4d178e1469ebce1eb8403')

build() {
  cd "ZeGrapher-3.0.2"
  qmake
  make
}

package() {
  cd "ZeGrapher-3.0.2"
  install -Dm755 ZeGrapher "$pkgdir"/usr/bin/ZeGrapher
  install -Dm644 appicon.ico "$pkgdir"/usr/share/pixmaps/ZeGrapher.ico
} 
