# Maintainer: helix <stargr@gmail.com>
pkgname=chaptedit
pkgver=1.2
pkgrel=1
pkgdesc='Chapters editor written in bash'
arch=('any')
license=('GPL2')
depends=('bash' 'dos2unix' 'uchardet')
url="https://github.com/helixarch/chaptedit"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/chaptedit/archive/$pkgver.tar.gz"
        "chaptedit.install")

sha512sums=('8ff1ff02320d5f5a3c093fa86bda9e223ab1ada3d4558134ab72ca2150efcd830620f6dbb73a4714c0a0ed5a64f41522f3eee26502156cdf733cdd45a059c116'
            '43b42efe5597ab8356a82e7ccc1a1c98a043204c6c3e755a12db4b478f46af52e08b3c890c888cc1d37cbcad5fc4e851e7419e0c8d3a017018962068add000fb')

install=chaptedit.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 chaptedit "$pkgdir/usr/bin/chaptedit"
}
