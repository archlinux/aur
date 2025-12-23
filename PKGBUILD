# Maintainer: CreamSodass <greatvaluecreamsoda@gmail.com>

pkgname=ffvship
pkgver=4.0.2
pkgrel=1
pkgdesc="CLI tool for computing the metric difference between two videos"
arch=('x86_64')
url='https://github.com/Line-fr/Vship'
license=('MIT')
depends=('ffms2' 'libvship')
makedepends=('make' 'clang')
sha256sums=('SKIP')
source=("https://github.com/Line-fr/Vship/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "Vship-${pkgver}"
  make buildFFVSHIP
}

package() {
  cd "Vship-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}