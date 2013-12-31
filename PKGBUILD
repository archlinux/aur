gitname=pycollada
pkgname=${gitname}-git
pkgver=20130416
pkgrel=1
pkgdesc="Create, edit and load COLLADA documents in Python"
arch=('any')
url="https://github.com/${gitname}/${gitname}"
license=("BSD3")
depends=('python2-lxml' 'python2-numpy' 'python2-dateutil' 'python2-distribute')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
	 cd "${srcdir}/${gitname}"
	 python2 setup.py build
}

package() {
	 cd "${srcdir}/${gitname}"
	 python2 setup.py install --root="$pkgdir" --optimize=1
}
