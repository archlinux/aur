# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-sabyenc3'
_name=${pkgname#python-}
pkgver=5.0.1
pkgrel=1
pkgdesc='yEnc package optimized for use within SABnzbd.'
arch=('any')
url='https://pypi.org/project/sabyenc3/'
license=('lgplv3')

makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('30828148fb370ad1130de7e2a3337be7c866261766c3452a5721bdb76db8b5fc')

package() {
  cd sabyenc3-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
