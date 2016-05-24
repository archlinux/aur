pkgname=python2-dfdatetime
_realname=dfdatetime
pkgver=20160323
pkgrel=1
pkgdesc="Digital Forensics date and time" 
url="https://github.com/log2timeline/dfdatetime"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python2')
options=()
source=(https://github.com/log2timeline/${_realname}/archive/${pkgver}.zip)

build() {
	export PYTHON=python2
	cd "$srcdir"/${_realname}-${pkgver}

	python2 setup.py build
}

package() {
	cd "$srcdir"/${_realname}-${pkgver}
	python2 setup.py install --root="${pkgdir}"
}
md5sums=('6baa6610bba5906e42925315a4b00932')
