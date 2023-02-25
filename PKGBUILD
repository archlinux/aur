# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=harbor-wave
pkgver=0.3
pkgrel=1
pkgdesc="Digital Ocean Temporary Droplet Spawn/Manipulation Tool"
arch=('any')
url="https://github.com/GIJack/harbor-wave"
license=('GPLv3')
depends=('python' 'python-digitalocean')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/harbor-wave/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fdb837f647640f03c473c94625b2dee585c9003e0f0cb356dc3833564f371227')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
