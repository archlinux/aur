# Maintainer: Venik1821 <venik1821@gmail.com>
pkgname=aniship-night-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="AniShip Night - anime streaming client"
arch=('x86_64')
url="https://github.com/Veniamin668/AniShip-fork"
license=('MIT')
depends=('gtk3' 'nss' 'libxslt' 'libxtst')
provides=('aniship-night')
conflicts=('aniship-night-git')

# Скачиваем готовый pacman пакет
source=("aniship-night-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/Veniamin668/AniShip-fork/releases/download/v${pkgver}/aniship-night-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('SKIP')

package() {
  # Просто распаковываем готовый пакет
  tar -xvf "${srcdir}/aniship-night-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}"
}
