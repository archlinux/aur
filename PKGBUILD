# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=polly
pkgver=0.93.5
_prealphaver=3.5
pkgrel=2
pkgdesc="Linux Twitter client designed for multiple columns of multiple accounts"
arch=(any)
url="https://launchpad.net/polly"
license=('GPL')
depends=(python2-notify python2-httplib2 pyxdg python2-gconf python2-pycurl socksipy python2-gtkspell hspell python2-keyring python2-oauth2 python2-numpy)
makedepends=(python2-distribute)
install=$pkgname.install
source=(http://launchpad.net/$pkgname/1.0/pre-alpha-2/+download/Polly-$pkgver%20%28pre-alpha%20$_prealphaver%29.tar.gz)

package() {
	cd "$srcdir/Polly-$pkgver (pre-alpha $_prealphaver)"
	python2 setup.py install --root="$pkgdir" --prefix=/usr
}

sha256sums=('e489e6fcd6f4c520a741448a4dcb5225b9ccbbd089e859525b5a191b6d7fc12b')
