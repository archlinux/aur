# Maintainer: bluemeda <affif[dot]bluemeda[at]gmail[dot]com>
_name=mutagen
pkgname=python2-mutagen-1.30
pkgver=1.30
pkgrel=1
pkgdesc='read and write audio tags for many formats'
arch=('any')
url="https://bitbucket.org/lazka/$_name"
license=('GPL2')
depends=('python2')
makedepends=('python2-setuptools')
provides=("python2-mutagen=$pkgver")
conflicts=('python2-mutagen')
source=("https://pypi.python.org/packages/source/m/$_name/$_name-$pkgver.tar.gz")
md5sums=('2c2069bd6a8245f99845f160da37f2ac')

package() {
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
}
