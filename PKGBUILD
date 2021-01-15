# Maintainer: helix <stargr@gmail.com>
pkgname=chaptedit
pkgver=1.2.2
pkgrel=1
pkgdesc='Chapters editor written in bash'
arch=('any')
license=('GPL2')
depends=('bash' 'dos2unix' 'uchardet')
url="https://github.com/helixarch/chaptedit"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/chaptedit/archive/$pkgver.tar.gz"
        "chaptedit.install")

sha512sums=('202ce90e14090b909a97af159acfe3c0e3e8702c4e490c2baf0be9c202e9a7e4fad738303363a21fc2b66826bb1680d0ac0d52a6bdf788d61e98a60015899085'
            '43b42efe5597ab8356a82e7ccc1a1c98a043204c6c3e755a12db4b478f46af52e08b3c890c888cc1d37cbcad5fc4e851e7419e0c8d3a017018962068add000fb')

install=chaptedit.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 chaptedit "$pkgdir/usr/bin/chaptedit"
}
