# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-usage
pkgver=0.9.0
pkgrel=1
pkgdesc='Usage statistics dashboard for Pi sessions'
arch=('any')
url='https://github.com/tmustier/pi-extensions/tree/main/usage-extension'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/tmustier/pi-extensions/archive/refs/tags/usage-extension/v${pkgver}.tar.gz"
)
sha256sums=('58d4f316352dbed606d290e5c0514e88bd33c65d9a586d56b98e74020c97ed91')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -Dm644 "${srcdir}/pi-extensions-usage-extension-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/pi/extensions/usage-extension"
  cp -a "${srcdir}/pi-extensions-usage-extension-v${pkgver}/usage-extension/." "${pkgdir}/usr/share/pi/extensions/usage-extension/"
}
