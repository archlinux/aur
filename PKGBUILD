# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ssh-fingerprints
pkgver=0.4
pkgrel=1
pkgdesc="Small script to display all used SSH fingerprints for easier verification"
arch=("any")
url="https://github.com/kepi/ssh-fingerprints"
license=("MIT")
depends=("openssh")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4ef90e1c037f5352251a54778750bae1839cea8d95c3428c8583775419a0d9dfe1aa7728c9646bfa6032f35e509586113a1ac872d37ae7d28ab3d2c167f04fff')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
