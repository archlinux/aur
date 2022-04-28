# Maintainer: Gabe Banks <gabriel.t.banks@gmail.com>
pkgname='forx'
pkgver=1.0.4
pkgrel=1
pkgdesc="a command line tool for checking exchange rates between currencies, both crypto and fiat."
arch=('x86_64')
url="https://github.com/Gbox4/forx"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'git')
provides=('forx')
source=("git+$url")
md5sums=('SKIP')

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
