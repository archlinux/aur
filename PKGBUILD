# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=python2-ushlex
pkgver=0.99
pkgrel=1
pkgdesc="Shlex is A lexical analyzer class for simple shell-like syntaxes."
arch=('any')
url="https://pypi.python.org/pypi/ushlex"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("https://bitbucket.org/mixmastamyk/ushlex/get/default.tar.gz")
sha512sums=('b7fb8bccea275fcfaca501e1e6e47d2dbf03f655981992be629bf845197a4b70238f8bbf958271d3d5cddc2d0ee7bd137f95c1785f5fd3bbe4d11799daff7923')

build() {
	cd $srcdir/mixmastamyk-ushlex-5dde196743a7
  python2 setup.py build
}

package() {
	cd $srcdir/mixmastamyk-ushlex-5dde196743a7
	python2 setup.py install --root="$pkgdir" --optimize=1
}

