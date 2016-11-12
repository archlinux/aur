# Maintainer: Erez Raviv (erezraviv@gmail.com)
pkgname=chirp-daily
pkgver=20161112
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
sha1sums=("4b26d8f84dc9ee529f29930c937d73912071cc9c")
source=("http://trac.chirp.danplanet.com/chirp_daily/daily-20161112/chirp-daily-20161112.tar.gz")

build() {
  tar zxvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

