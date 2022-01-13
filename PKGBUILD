# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=plymouth-theme-ecorp-glitch
pkgver=1.0.0
pkgrel=1
pkgdesc='E-Corp glitch animation from Mr. Robot scene ported to Plymouth'
arch=('any')
url='https://github.com/hrshbh/plymouth-themes'
license=('GPL3')
makedepends=('git')
depends=('plymouth')
install="${pkgname}.install"
source=(
  'git+https://github.com/hrshbh/plymouth-themes.git'
)
sha256sums=('SKIP')

package() {
  cd "${srcdir}/plymouth-themes/ecorp-glitch"

  install -d "${pkgdir}/usr/share/plymouth/themes/ecorp-glitch"
  install -Dm 644 * "${pkgdir}/usr/share/plymouth/themes/ecorp-glitch"
}
