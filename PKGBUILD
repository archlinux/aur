# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-usage
pkgver=0.9.1
pkgrel=1
pkgdesc='Usage statistics dashboard for Pi sessions'
arch=('any')
url='https://github.com/tmustier/pi-extensions/tree/main/usage-extension'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/tmustier/pi-extensions/archive/refs/tags/usage-extension/v${pkgver}.tar.gz"
)
sha256sums=('5741c446c873e3e5e51dae2427fc4cb5ba0853c5d9b5f2a8ae6585dcba4e1d6d')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -Dm644 "${srcdir}/pi-extensions-usage-extension-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/pi/extensions/usage-extension"
  cp -a "${srcdir}/pi-extensions-usage-extension-v${pkgver}/usage-extension/." "${pkgdir}/usr/share/pi/extensions/usage-extension/"
}
