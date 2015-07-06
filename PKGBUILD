# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Nicholas Tryon (KC2YTG) <dhraak at gmail dot com>

pkgname=chirp
pkgver=0.4.1
pkgrel=1
pkgdesc="GUI tool for programming ham radios; supports a large number of makes and models"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL')
depends=('python2-lxml' 'python2-pyserial' 'desktop-file-utils' 'pygtk')
provides=('chirp')
conflicts=('chirp-daily')
options=(!emptydirs)
install=$pkgname.install
source=("http://chirp.danplanet.com/download/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('a86efa2bb05c33419b36cc9969327c86')
sha256sums=('8c9d652dc89dbab9e2a1a75c07aa7179ce403de078a4d02814365f89e183319e')
