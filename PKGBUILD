# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-subagents
pkgver=0.24.4
pkgrel=1
pkgdesc='Subagents extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-subagents'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-subagents/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('ae9910fa3f8b52059460401ac8f6136c95ced7a6a8f04e1aa8834390a08dd649')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/subagents"
  cp -a "${srcdir}/pi-subagents-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/subagents/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/subagents/test"
}
