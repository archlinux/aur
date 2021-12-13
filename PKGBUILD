# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-sabyenc3'
_name=${pkgname#python-}
pkgver=4.0.2
pkgrel=3
pkgdesc='yEnc package optimized for use within SABnzbd.'
arch=('any')
url='https://pypi.org/project/sabyenc3/'
license=('lgplv3')

makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('dfaa0bdd01752a9cfde0d349a8f4e178b04b1cf9c1bc018b287961192cd2bb90')

package() {
  cd sabyenc3-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
