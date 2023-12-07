# Maintainer: Nicholas Georgescu <nsg27@case.edu>
pkgname=golfscript
pkgver=0.0.0
pkgrel=2
pkgdesc="A simple stack based code golf language"
arch=('any')
url="http://golfscript.com/golfscript"
license=('MIT')
depends=('ruby')
source=("https://raw.githubusercontent.com/darrenks/golfscript/main/golfscript.rb")
sha256sums=('84f932a624b19afe6ef2a3ebe09a9b832f765a87460a79cde22323615c468f38')

package() {
  install -Dm755 "${srcdir}/golfscript.rb" "${pkgdir}/usr/bin/golfscript"
}
