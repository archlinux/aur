# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=nodejs-jslint
pkgver=0.9.3
pkgrel=1
pkgdesc='The JavaScript Code Quality Tool'
arch=('any')
url='https://github.com/reid/node-jslint'
license=('BSD' 'custom:modified MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/reid/node-jslint/archive/v${pkgver}.tar.gz")
sha256sums=('740ef493529fc11a4fbe700c54fa05c63881ea23d33fecba0cdab966093a93a4')

package() {
  cd "${srcdir}/node-jslint-${pkgver}"

  npm install --user root -g --prefix="${pkgdir}"/usr

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
