# Author: Emil Lundberg <emil@emlun.se>

pkgname=gradle-autowrap
pkgver=1.1.2
pkgrel=1
pkgdesc="Alternative Gradle front-end that redirects to Gradle wrapper if available"
arch=('any')
license=('custom:unlicense')
depends=('bash')
source=("git+https://github.com/emlun/gradle-autowrap#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  install -Dm 555 "${srcdir}/${pkgname}"/gradle-autowrap.sh "${pkgdir}"/usr/local/bin/gradle
  install -Dm 444 "${srcdir}/${pkgname}"/UNLICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/UNLICENSE
}
