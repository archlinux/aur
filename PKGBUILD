# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://github.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0')
source=('pac')
noextract=('pac')
sha256sums=('74f077c4cdd95e8e8c691f10a06d8c11c4fda4e793a45243a84e703ee3937374')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 pac "$pkgdir"/usr/bin/

}
