# Maintainer: Erez Raviv (erezraviv@gmail.com)
pkgname=chirp-daily
pkgver=20160713
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
sha1sums=("70bba3a38ab5612b98997edcde76d2eef2a27eef")
source=("http://trac.chirp.danplanet.com/chirp_daily/daily-20160713/chirp-daily-20160713.tar.gz")

build() {
  tar zxvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

