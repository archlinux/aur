# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.0.6
pkgrel=1 
pkgdesc="Game Backup Monitor monitors games and backs up their savegames"
url="https://mikemaximus.github.io/gbm-web/linux.html"
license=('GPL3')
arch=('any')
makedepends=('imagemagick')
depends=('mono-basic' 'sqlite' 'p7zip')
source=("https://github.com/MikeMaximus/gbm/releases/download/v${pkgver}/GBM.v${pkgver}.32-bit.7z")
sha256sums=('f22577dc268197c502431bc89d1d170f47bc5233b15a8d4947670161dfa00d1c')

package() {
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
