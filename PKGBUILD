# Maintainer: Erez Raviv (erezraviv@gmail.com)
pkgname=chirp-daily
pkgver=20160909
pkgrel=1
pkgdesc="Latest build for GUI tool for programming ham radios"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL')
depends=('python2-lxml' 'python2-pyserial' 'desktop-file-utils' 'pygtk')
options=(!emptydirs)
conflicts=(chirp)
provides=(chirp)
install=
sha1sums=("6e3ea77ac274425e2c53972e72a984c3d909d9b7")
source=("http://trac.chirp.danplanet.com/chirp_daily/daily-20160909/chirp-daily-20160909.tar.gz")

build() {
  tar zxvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

