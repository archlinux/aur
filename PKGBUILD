# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=harbor-wave
pkgver=0.6
pkgrel=1
pkgdesc="Digital Ocean Ephemeral VM/Droplet tool."
arch=('any')
url="https://github.com/GIJack/harbor-wave"
license=('GPLv3')
depends=('python' 'python-digitalocean')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/harbor-wave/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4acc4d816dd352ad084d5c724ad1eb9fd5dbcced14fc607e56a8b853149ab758')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
