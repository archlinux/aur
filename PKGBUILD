# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=harbor-wave
pkgver=0.5.1
pkgrel=1
pkgdesc="Digital Ocean Temporary Droplet Spawn/Manipulation Tool"
arch=('any')
url="https://github.com/GIJack/harbor-wave"
license=('GPLv3')
depends=('python' 'python-digitalocean')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/harbor-wave/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('43f7e10d3d7d0d1a995cc2fd8aff8925956048203e59eae45e86cd751b07748c')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
