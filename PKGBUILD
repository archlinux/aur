# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.0.2
pkgrel=1
epoch=1
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://github.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0')
source=('pac')
noextract=('pac')
sha256sums=('0cf1061fff3d312748c3c1c6dda475b2f3e48c24e9979b192570fe9ec2362d28')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 pac "$pkgdir"/usr/bin/

}
