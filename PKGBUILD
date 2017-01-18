# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.2.0
pkgrel=1
epoch=1
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://github.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0')
source=('pac')
noextract=('pac')
sha256sums=('b8a0ba2a2abd81f1c500afefa9071778b18614ea3e27fb00f6b58580206c1744')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 pac "$pkgdir"/usr/bin/

}
