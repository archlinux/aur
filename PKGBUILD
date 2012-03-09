# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=polly
pkgver=0.93.4
_prealphaver=3.4
pkgrel=1
epoch=
pkgdesc="Linux Twitter client designed for multiple columns of multiple accounts"
arch=(any)
url="https://launchpad.net/polly"
license=('GPL')
depends=(python-notify python2-httplib2 pyxdg python2-gconf python-pycurl socksipy python2-gtkspell hspell python-keyring python2-oauth2 python2-numpy)
makedepends=(python2-distribute)
install=$pkgname.install
source=(http://launchpad.net/$pkgname/1.0/pre-alpha-2/+download/Polly-$pkgver%20%28pre-alpha%20$_prealphaver%29.tar.gz)

package() {
	cd "$srcdir/Polly-$pkgver (pre-alpha $_prealphaver)"
	python2 setup.py install --root="$pkgdir" --prefix=/usr
}

md5sums=('4484a207a9427adeb877f5577d0fee0b')
