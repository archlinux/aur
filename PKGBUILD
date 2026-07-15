# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-cursor-rules
pkgver=1.0.1
pkgrel=1
pkgdesc='Cursor-style project rules (.cursor/rules/) for pi-coding-agent'
arch=('any')
url='https://github.com/dougefresher/pi-ext-cursor-rules'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dougefresher/pi-ext-cursor-rules/archive/refs/tags/v${pkgver}.tar.gz")
install='pi-ext.install'
sha256sums=('e694c0f1b95d3660ea9ecf97db0d4fded0c8d23b9d5da24593351aa5dd99b20b')
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/cursor-rules"
  cp -a "${srcdir}/pi-ext-cursor-rules-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/cursor-rules/"
}
