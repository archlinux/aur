# Maintainer: Network Jack <Network_Jack@null.net>

pkgname=harbor-wave
pkgver=0.6.1
pkgrel=2
pkgdesc="Digital Ocean Ephemeral VM/Droplet tool."
arch=('any')
url="https://github.com/NetworkJack2/harbor-wave"
license=('GPLv3')
depends=('python' 'python-digitalocean')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/harbor-wave/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4c3871230f61c4be43b12226bca04a2fb561028f45fc5ae630cd5c7a0380ed57')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
