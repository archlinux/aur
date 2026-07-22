# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-usage
pkgver=0.9.4
pkgrel=1
pkgdesc='Usage statistics dashboard for Pi sessions'
arch=('any')
url='https://github.com/tmustier/pi-extensions/tree/main/usage-extension'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/tmustier/pi-extensions/archive/refs/tags/usage-extension/v${pkgver}.tar.gz"
)
sha256sums=('11439c3c586288921eac36f69692e82206f3671a9164876f0881381f6d44de9f')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -Dm644 "${srcdir}/pi-extensions-usage-extension-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/pi/extensions/usage-extension"
  cp -a "${srcdir}/pi-extensions-usage-extension-v${pkgver}/usage-extension/." "${pkgdir}/usr/share/pi/extensions/usage-extension/"
}
