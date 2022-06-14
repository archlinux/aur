# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-sabyenc3'
_name=${pkgname#python-}
pkgver=5.4.3
pkgrel=1
pkgdesc='yEnc package optimized for use within SABnzbd.'
arch=('any')
url='https://pypi.org/project/sabyenc3/'
license=('lgplv3')

makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7a2fd29d58383b2e9c0413f1835e2530c40181b351e0583469afbcb150536346')

package() {
  cd sabyenc3-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
