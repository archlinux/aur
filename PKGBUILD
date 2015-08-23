# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-fritzconnection
pkgver=0.4.6
pkgrel=1
pkgdesc='Communicate with the AVM FritzBox'
license=('MIT')
arch=('x86_64' 'i686')
url='https://bitbucket.org/kbr/fritzconnection'
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/f/fritzconnection/fritzconnection-${pkgver}.tar.gz")
sha512sums=('d84f8812f561b4a20813d1b83d8885ac43c764b3ddf4398edc5d444b30c854e5b45e515407ee8a8931d6f500aa8a3bd3d0c5fdb4618475b5c67623e262bc2c21')

package() {
  cd "fritzconnection-${pkgver}"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
