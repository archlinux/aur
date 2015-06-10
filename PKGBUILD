# Maintainer: Prurigro
# Contributor: Prurigro

pkgname=sshmnt
pkgver=1.6
pkgrel=3
pkgdesc="A utility for managing multiple sshfs profiles from the commandline"
url="https://github.com/prurigro/sshmnt"
license=('GPL3')
arch=('any')
depends=('fuse' 'sshfs' 'openssh' 'bc')
source=("https://github.com/prurigro/$pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('7ef2fcc2a357ada62433c05225bc3184cd085bdb29f85bbe5df81e088a2b9bfb6be3ad2d7ce970001278832e9a7d85421396dbc8f2b85504c8c81e5b53485802')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 ${pkgname}.1.gz "$pkgdir"/usr/share/man/man1/${pkgname}.1.gz
}
