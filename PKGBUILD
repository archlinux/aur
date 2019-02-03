# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
aur_name=python-sphinx-hawkmoth
pkgname=$aur_name-git
pkgver=latest
pkgrel=2
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
provides=($aur_name)
conflicts=($aur_name)
source=('git+https://github.com/jnikula/hawkmoth')
md5sums=('SKIP')

package() {
	dest=$pkgdir/usr/lib/python3.7/site-packages/$upstream_name
	mkdir -p $dest
	cp -r $srcdir/$upstream_name/$upstream_name/* $dest
}
