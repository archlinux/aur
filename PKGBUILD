# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Erdbeerkaese
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=slingshot
pkgver=0.10
pkgrel=1
pkgdesc="A 2D strategy game in the gravity fields of several planets"
arch=('any')
url="https://github.com/schuellerf/slingshot"
license=('GPL')
depends=('python2-pygame' 'python2-docopt')
makedepends=('python2-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/schuellerf/slingshot/archive/${pkgver}.tar.gz")
sha256sums=('9b076414bc163aea764bbe1a9bd9377a1c160fc9804d19e1fec8e67beac53bb1')

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" \
  		--no-compile -O0
}
