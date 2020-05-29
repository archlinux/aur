# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=python-aur
pkgver=0.11.0
pkgrel=1
pkgdesc='Arch User Repository API interface for Python'
arch=('any')
url='https://github.com/cdown/aur'
license=('ISC')
depends=('python-requests' 'python-inflection')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/a/aur/aur-${pkgver}.tar.gz)
md5sums=('3519e86d744555781d5d98f561ff8665')

package() {
  cd "aur-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
