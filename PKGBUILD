# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=snapcraft
pkgver=2.9
pkgrel=1
pkgdesc="Build Ubuntu snappy packages."
arch=('any')
url="http://ubuntu.com/snappy"
license=('GPL')
depends=('python-apt' 'python-requests-oauthlib' 'python-ssoclient' 'python-progressbar' 'python-requests-toolbelt' 'python-petname')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/ubuntu-core/snapcraft/archive/${pkgver}.tar.gz")
sha256sums=('591ae933ef027e9b119bd9cb5b418488e996dbde4744478d409839fbebb79ade')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
