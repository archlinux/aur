# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>
#
# This package now follows a branch since there's no proper release yet. This
# package will eventually transition to a stable release.

pkgname=hawkmoth
pkgver=latest
pkgrel=2
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
source=('git+https://github.com/jnikula/hawkmoth')
md5sums=('SKIP')

package() {
	dest=$pkgdir/usr/lib/python3.7/site-packages/$pkgname
	mkdir -p $dest
	install $srcdir/$pkgname/$pkgname/*.py $dest
}
