 # Maintainer: Mickael Bosch <mickael dot bosch at hl2 dot com>
pkgname='zegrapher'
pkgver=3.0.0
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.zegrapher.com"
makedepends=()
license=('GPL')
pkgdesc="mathematical objects plotting software"
depends=(qt5-base)
conflicts=(zegrapher)
source=("https://github.com/AdelKS/ZeGrapher/archive/v3.0.zip")
md5sums=('82cc38fa4904f1a506038462398c6e3d')

build() {
  cd "ZeGrapher-3.0"
  qmake
  make
}

package() {
  cd "ZeGrapher-3.0"
  install -Dm755 ZeGrapher "$pkgdir"/usr/bin/ZeGrapher
  install -Dm644 appicon.ico "$pkgdir"/usr/share/pixmaps/ZeGrapher.ico
} 
