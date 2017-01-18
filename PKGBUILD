# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.1.1
pkgrel=1
epoch=1
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://github.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0')
source=('pac')
noextract=('pac')
sha256sums=('666ba165dbf4c4b15a19f3f6cf701068055905f8f5e72e00d4b122e849ac351c')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 pac "$pkgdir"/usr/bin/

}
