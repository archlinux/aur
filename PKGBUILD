# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://github.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0')
source=('pac')
noextract=('pac')
sha256sums=('8da9afdd9cd2c6f5df76e3b3716903b6f4f853c10967648499ce90ae8be93b67')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 pac "$pkgdir"/usr/bin/

}
