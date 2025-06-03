# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-diffsims
pkgshort=diffsims
pkgver=0.7.0
pkgrel=1
pkgdesc="Python library for simulating diffraction."
arch=('any')
url="https://diffsims.rtfd.io/"
license=('GPL3')

depends=('python'
         'python-diffpy.structure>=3.0.2'
         'python-matplotlib>=3.3'
	 'python-numba'
	 'python-numpy>=1.17.3'
	 'python-orix>=0.12.1'
	 'python-psutil'
         'python-scipy>=1.8'
	 'python-tqdm>=4.9'
	 'python-transforms3d'
         )

makedepends=('python-setuptools' )

provides=('diffsims')

source=(https://github.com/pyxem/diffsims/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('c908a8aec2f559f644e8f5c6aa3e195f')
