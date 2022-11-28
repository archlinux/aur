# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=harbor-wave
pkgver=0.2
pkgrel=1
pkgdesc="Digital Ocean Temporary Droplet Spawn/Manipulation Tool"
arch=('any')
url="https://github.com/GIJack/harbor-wave"
license=('GPLv3')
depends=('python' 'python-digitalocean')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/harbor-wave/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('48ea516d001a4b77480488d4c9fb1106b4f7d8d91f8bbf7ede19cb1e8f3c481f')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
