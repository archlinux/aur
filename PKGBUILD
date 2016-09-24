# Maintainer: Erez Raviv (erezraviv@gmail.com)
pkgname=chirp-daily
pkgver=20160924
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
sha1sums=("e22a3766ec07c98d75627a43f4e2421837a5f66e")
source=("http://trac.chirp.danplanet.com/chirp_daily/daily-20160924/chirp-daily-20160924.tar.gz")

build() {
  tar zxvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

