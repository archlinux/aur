# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-sabyenc3'
_name=${pkgname#python-}
pkgver=5.4.4
pkgrel=1
pkgdesc='yEnc package optimized for use within SABnzbd.'
arch=('any')
url='https://pypi.org/project/sabyenc3/'
license=('lgplv3')
depends=('python')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f3d65f2a70bcb13ef1beae0ff6bb3b69adae18497035f8cd4ffe4e5af1aa2f41')

package() {
  cd sabyenc3-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
