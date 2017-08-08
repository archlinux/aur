# Maintainer: helix <stargr@gmail.com>
pkgname=chaptedit
pkgver=1.1
pkgrel=1
pkgdesc='Chapters editor written in bash'
arch=('any')
license=('GPL2')
depends=('bash' 'dos2unix' 'uchardet')
url="https://github.com/helixarch/chaptedit"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/chaptedit/archive/$pkgver.tar.gz"
        "chaptedit.install")

sha512sums=('bb8063f7a346e46aeb6e76f5c42897f350cf18a1551f71da317e00d29eac3407a05bb5d91da7cec0dcf8fce845d9a2f2b23e227ec214cc14147c75ae4f046d10'
            '43b42efe5597ab8356a82e7ccc1a1c98a043204c6c3e755a12db4b478f46af52e08b3c890c888cc1d37cbcad5fc4e851e7419e0c8d3a017018962068add000fb')

install=chaptedit.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 chaptedit "$pkgdir/usr/bin/chaptedit"
}
