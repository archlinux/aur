# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=harbor-wave
pkgver=0.4
pkgrel=1
pkgdesc="Digital Ocean Temporary Droplet Spawn/Manipulation Tool"
arch=('any')
url="https://github.com/GIJack/harbor-wave"
license=('GPLv3')
depends=('python' 'python-digitalocean')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/harbor-wave/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e5b6b2f37c896f2af2c49184476a01e9a46e5454ffbc29a84d953b6a893beae4')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
