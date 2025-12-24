# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Denis Vadimov <me@bloody.pw>
pkgname=python-bpylist2
pkgver=4.1.1
pkgrel=2
pkgdesc="Parse and Generate binary plists and NSKeyedArchiver archives"
arch=('any')
url="https://github.com/parabolala/bpylist2"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/b/bpylist2/bpylist2-$pkgver.tar.gz")
md5sums=('6f284eb91f997cfa0df3b4401aadf49e')


package() {
	cd "${srcdir}/bpylist2-${pkgver}"
	python setup.py install --root="$pkgdir"
}
