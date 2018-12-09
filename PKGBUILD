# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>
#
# This package now follows a development branch since there's no working release
# yet. This package will eventually transition to a stable release.

pkgname=hawkmoth
pkgver=latest
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://gitlab.com/bms-contrib/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
source=('git+https://gitlab.com/bms-contrib/hawkmoth#branch=unrot')
md5sums=('SKIP')

package() {
	dest=$pkgdir/usr/lib/python3.7/site-packages/$pkgname
	mkdir -p $dest
	install $srcdir/$pkgname/$pkgname/*.py $dest
}
