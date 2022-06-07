# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-sabyenc3'
_name=${pkgname#python-}
pkgver=5.4.2
pkgrel=1
pkgdesc='yEnc package optimized for use within SABnzbd.'
arch=('any')
url='https://pypi.org/project/sabyenc3/'
license=('lgplv3')

makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('eb05f098bd51099ef6292a8980c8cede0aefb832d6c8cb1bb94fa42661240a63')

package() {
  cd sabyenc3-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
