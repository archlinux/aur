# Contributor: Ethan Zonca <e@ethanzonca.com>
pkgname=python-cantools
provides=('python-cantools')
conflicts=('python-cantools')
pkgdesc="Python CAN bus tools in Python 3"
url="https://github.com/eerimoq/cantools"
pkgver=32.19.0
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
license=('GPL3')
depends=('python' 'codespell' 'python-mock' 'python-can' 'python-diskcache')
makedepends=('git')

source=("git+https://github.com/eerimoq/cantools.git")
md5sums=('SKIP')

package() {
	cd $srcdir/cantools
	python setup.py install --root="$pkgdir/" --optimize=1 
}
