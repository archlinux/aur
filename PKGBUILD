# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.0.1
pkgrel=1
epoch=1
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://github.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0')
source=('pac')
noextract=('pac')
sha256sums=('287f1bbd32f17cdb7778454000593005a473a6a37dabf570b6c9cbfed94c8eef')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 pac "$pkgdir"/usr/bin/

}
