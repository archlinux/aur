# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.5
pkgrel=2
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
md5sums=('2dfa6cb734e367eb9be36619d84d0b06')

package() {
	install -D -m644 $srcdir/$upstream_name-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd $srcdir/$upstream_name-$pkgver
	python setup.py install --optimize=1 --root=$pkgdir
}
