# Maintainer: Erez Raviv (erezraviv@gmail.com)
pkgname=chirp-daily
pkgver=20170212
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
sha1sums=("2ae632f704120fdfa3884f8877446c4f6c69056f")
source=("http://trac.chirp.danplanet.com/chirp_daily/daily-20170212/chirp-daily-20170212.tar.gz")

build() {
  tar zxvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

