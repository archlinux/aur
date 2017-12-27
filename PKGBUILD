# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.0.5
pkgrel=3
pkgdesc="Game Backup Monitor monitors games and backs up their savegames"
url="https://mikemaximus.github.io/gbm-web/linux.html"
license=('GPL3')
arch=('any')
makedepends=('imagemagick')
depends=('mono-basic' 'sqlite' 'p7zip')
source=("https://github.com/MikeMaximus/gbm/releases/download/v${pkgver}/GBM.v${pkgver}.32-bit.7z"
        'makefile'
        'gbm.sh')
sha256sums=('e71f8ecfd7432a055abdea9e4198cdf39aff22ccba1440ad8e5d47064f2d2dc3'
            'b669167553a07f059b03b3fa060ebcc6df9c6a783bbadecdd9ec59c72a911166'
            'bca2f7c08ecf1ff1be133f4c64a1637f7d0bf410216c9d781fd217b1c091267e')

package() {
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
