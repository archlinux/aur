# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-pygwinc
_name=pygwinc
pkgver=0.5.0
pkgrel=1
pkgdesc="Gravitational Wave Interferometer Noise Calculator"
license=("Unlicense")
url="https://git.ligo.org/gwinc/pygwinc"
depends=('python-numpy' 'python-scipy' 'python-yaml' 'python-matplotlib')
source=("git+https://git.ligo.org/gwinc/$_name")
sha256sums=('SKIP')
arch=('any')

build() {
	cd $srcdir/${_name}
	python setup.py build
}

package() {
	cd $srcdir/${_name}
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
}
	
