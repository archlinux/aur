# Maintainer: Philipp A. <flying-sheep@web.de>

_name=pyelftools
pkgname=python-elftools
pkgver=0.24
pkgrel=1
pkgdesc='Library for analyzing ELF files and DWARF debugging information'
arch=(any)
url='https://github.com/eliben/pyelftools'
depends=(python)
license=('custom:Public domain')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('c960d5fe0a9308d96ba38b4beec8ac8e')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
