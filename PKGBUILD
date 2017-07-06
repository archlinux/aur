# Maintainer: Erez Raviv (erezraviv@gmail.com)
pkgname=chirp-daily
pkgver=20170706
pkgrel=1
pkgdesc="Latest build for GUI tool for programming ham radios"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL3')
depends=('python2-lxml' 'python2-pyserial' 'pygtk')
optdepends=('hamradio-menus')
options=(!emptydirs)
conflicts=(chirp)
provides=(chirp)
install=
sha1sums=("745bb051f417dae64c4496d4299e4639b642fd2e")
source=("http://trac.chirp.danplanet.com/chirp_daily/daily-20170706/chirp-daily-20170706.tar.gz")

build() {
  tar zxvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

