# Maintainer: Nicholas Georgescu <nsg27@case.edu>
pkgname=golfscript-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A simple stack based code golf language"
arch=('any')
url="http://golfscript.com/golfscript"
license=('MIT')
depends=('ruby')
source=("https://raw.githubusercontent.com/darrenks/golfscript/main/golfscript.rb")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/golfscript.rb" "${pkgdir}/usr/bin/golfscript"
}
