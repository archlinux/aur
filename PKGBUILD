# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname='spambayes'
pkgver='1.1a6'
pkgrel='7'
pkgdesc='Bayesian anti-spam classifier written in Python'
arch=('any')
url="http://$pkgname.sourceforge.net/"
license=('PSF')
depends=('python2' 'python2-lockfile' 'python2-pydns' 'python2-setuptools')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('14752d9930a4f103789918a26eaed0348d27329f34e14666edfc6d05b6b01053')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	python2 setup.py install --root="$pkgdir"
}
