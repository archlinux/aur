# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-cursor-rules
pkgver=0.1.1
pkgrel=1
pkgdesc='Cursor-style project rules (.cursor/rules/) for pi-coding-agent'
arch=('any')
url='https://github.com/dougefresher/pi-ext-cursor-rules'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dougefresher/pi-ext-cursor-rules/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8fd73ab8465c4a7bd20f26c534d11a6800c48e80479f3c8918394a54063b0906')
install='pi-ext.install'

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/cursor-rules"
  cp -a "${srcdir}/pi-ext-cursor-rules-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/cursor-rules/"
}
