# Contributor: Ethan Zonca <e@ethanzonca.com>
pkgname=python-canard
provides=('python-canard')
conflicts=('python-canard')
pkgdesc="CANard is a library for dealing with Controller Area Network (CAN) data from Python"
url="http://github.com/normaldotcom/CANard"
pkgver=0.2.1
pkgrel=2
arch=('i686' 'x86_64' 'armv7h')
license=('GPL3')
depends=('python' 'python-pyserial')
makedepends=('git')

source=("git+https://github.com/normaldotcom/CANard.git")
md5sums=('SKIP')

package() {
	cd $srcdir/CANard
	python setup.py install --root="$pkgdir/" --optimize=1 
}

