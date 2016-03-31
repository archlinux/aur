# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=python-elpy
pkgver=1.11.0
pkgrel=1
pkgdesc="Package to bring powerful Python editing to Emacs. Python library only."
install="python-elpy.install"
arch=('any')
url="https://github.com/jorgenschaefer/elpy"
license=('GPL')
depends=('python-epc')
optdepends=('python-autopep8: format code according to PEP8'
            'python-importmagic: automatically manage imports in Python'
            'python-jedi: autocompletion library support'
            'python-rope: refactory library support')
options=(!emptydirs)
source=("https://github.com/jorgenschaefer/elpy/archive/${pkgver}.tar.gz")
md5sums=('aad6dac8a7e8b8d32be73bada728712a')

package() {
  cd "${srcdir}/elpy-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
