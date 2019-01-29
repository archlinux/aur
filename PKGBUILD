# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.2
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
md5sums=('2e1b15de86f85ecb4041845ff1f75b39')

package() {
	dest=$pkgdir/usr/lib/python3.7/site-packages/$pkgname
	mkdir -p $dest
	cp -r $srcdir/$upstream_name-$pkgver/$upstream_name/* $dest
}
