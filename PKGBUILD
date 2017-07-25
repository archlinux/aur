# Maintainer: helix <stargr@gmail.com>
pkgname=chaptedit
pkgver=1.0
pkgrel=1
pkgdesc='Chapters editor written in bash'
arch=('any')
license=('GPL2')
depends=('bash' 'dos2unix' 'uchardet')
url="https://github.com/helixarch/chaptedit"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/chaptedit/archive/$pkgver.tar.gz"
        "chaptedit.install")

sha512sums=('835466777ec66d8630e2bd01f5a32cd918be714b09b5970fd9fdf4608a66c1b839e253260ab6506fb02574bfcb139abc4164f9dbcb2f9caac99fbde0edef7754'
            '43b42efe5597ab8356a82e7ccc1a1c98a043204c6c3e755a12db4b478f46af52e08b3c890c888cc1d37cbcad5fc4e851e7419e0c8d3a017018962068add000fb')

install=chaptedit.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 chaptedit "$pkgdir/usr/bin/chaptedit"
}
