# Maintainer: Aashish Chapain <ashishchapain86@gmail.com> 

pkgname=sematrix-plymouth-theme
pkgver=1.0.0
pkgrel=1
pkgdesc='Matrix effect plymouth theme on boot'
arch=('any')
url='https://github.com/chapainaashish/sematrix'
license=('GPL3')
makedepends=('git')
depends=('plymouth')
install="${pkgname}.install"
source=(
  'git+https://github.com/chapainaashish/sematrix.git'
)
sha256sums=('SKIP')

package() {
  cd "${srcdir}/sematrix"

  install -d "${pkgdir}/usr/share/plymouth/themes/sematrix"
  install -Dm 644 * "${pkgdir}/usr/share/plymouth/themes/sematrix"
}
