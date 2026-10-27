# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-usage
pkgver=0.10.0
pkgrel=1
pkgdesc='Usage statistics dashboard for Pi sessions'
arch=('any')
url='https://github.com/tmustier/pi-extensions/tree/main/usage-extension'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/tmustier/pi-extensions/archive/refs/tags/usage-extension/v${pkgver}.tar.gz"
)
sha256sums=('807135dbdc1aeb3347291c89e04336b95e6971c37e6e1a15375a0b0af93b5fc6')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -Dm644 "${srcdir}/pi-extensions-usage-extension-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/pi/extensions/usage-extension"
  cp -a "${srcdir}/pi-extensions-usage-extension-v${pkgver}/usage-extension/." "${pkgdir}/usr/share/pi/extensions/usage-extension/"
}
