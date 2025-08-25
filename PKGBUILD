# Maintainer: Yuma Nur Alfath <yuma@yumana.my.id>
pkgname=alfathsave
pkgver=1.0.1
pkgrel=1
pkgdesc="Alfath Save - PS2 VMC save file reader"
arch=('x86_64')
url="https://github.com/yumanuralfath/alfath_save_ps2"
license=('MIT')
depends=()
makedepends=('gcc' 'make')
source=("https://github.com/yumanuralfath/alfath_save_ps2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/alfath_save_ps2-${pkgver}"
  make release
}

package() {
  cd "$srcdir/alfath_save_ps2-${pkgver}"
  install -Dm755 alfathsave "$pkgdir/usr/bin/alfathsave"
}
