# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-cursor-rules
pkgver=1.0.0
pkgrel=1
pkgdesc='Cursor-style project rules (.cursor/rules/) for pi-coding-agent'
arch=('any')
url='https://github.com/dougefresher/pi-ext-cursor-rules'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dougefresher/pi-ext-cursor-rules/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('498a09344e7c4da9002013354e35b22eb90b0691eda2628af5da0e1d4a66e934')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/cursor-rules"
  cp -a "${srcdir}/pi-ext-cursor-rules-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/cursor-rules/"
}
