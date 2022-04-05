# Maintainer: Philip <philip1731 protonmail ch>

pkgname=python-diffractio
pkgver=0.0.13
pkgrel=1
pkgdesc='Optical Diffraction and Interference (scalar and vectorial)'
arch=('any')
url="https://bitbucket.org/optbrea/diffractio/src/master/"
license=('MIT')
depends=('python'
         'python-click'
		 'python-numpy'
         'python-scipy'
         'python-matplotlib'
		 'python-nbsphinx')
makedepends=('python-setuptools'
			 'python-pytest-runner')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5bfb2fa72a185aaab19c7d9b1f37a6f4617e28206bb6d6532c3fe399593e7fea')

package() {
  cd "${srcdir}/diffractio-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

