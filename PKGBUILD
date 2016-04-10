# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=scour
pkgver=0.33
pkgrel=1
pkgdesc='An SVG scrubber'
arch=('any')
url='https://github.com/codedread/scour'
license=('APACHE')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/codedread/scour/archive/v${pkgver}.tar.gz")
sha256sums=('e9b4fb4beb653afbdbc43c4cc0836902d6f287d882b6b7cdf714c456ff0841a8')

build() {
  cd scour-${pkgver}

  python setup.py build
}

package() {
  cd scour-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
