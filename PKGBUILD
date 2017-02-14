# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.2.0
pkgrel=3
epoch=1
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://github.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0'
         'pacaur')
source=('pac')
noextract=('pac')
sha256sums=('93d3798ee5c36f1fd92c04dc6979dbde28edfffebaff60c085a41a10c8c45f65')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 pac "$pkgdir"/usr/bin/

}
