# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=snapcraft
pkgver=2.8.4
pkgrel=1
pkgdesc="Build Ubuntu snappy packages."
arch=('any')
url="http://ubuntu.com/snappy"
license=('GPL')
depends=('python-apt' 'python-requests-oauthlib' 'python-ssoclient' 'python-progressbar' 'python-requests-toolbelt' 'python-petname')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/ubuntu-core/snapcraft/archive/${pkgver}.tar.gz")
sha256sums=('c55cad3494a5126bf889ac5d951eb5b603279936d347d4530e9d2006faf6f010')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
