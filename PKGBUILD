# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.5
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
md5sums=('2dfa6cb734e367eb9be36619d84d0b06')

package() {
	dest=$pkgdir/usr/lib/python3.8/site-packages/$upstream_name
	mkdir -p $dest
	cp -r $srcdir/$upstream_name-$pkgver/$upstream_name/* $dest
}
