# Maintainer: robertfoster

pkgname=python2-pyee
pkgver=5.0.0
pkgrel=1
pkgdesc="A port of node.js's EventEmitter to python"
arch=(any)
url="https://github.com/jfhbrook/pyee"
license=('MIT')
depends=('python2')
source=("https://pypi.python.org/packages/c6/35/b37e4ffbf46063c883675e028e38e2a24b67433fd587f188e2a5005d9329/pyee-$pkgver.tar.gz")

package(){
	cd $srcdir/pyee-$pkgver
	python2 setup.py install --root="$pkgdir"
}

md5sums=('5e7dd623f031e8b22a9e1fa64bf00a5c')
