# Maintainer: Timo S. Prinz <t.prinz@coliza.de>
pkgname=librecal-udev-git
pkgver=0.2.3
pkgrel=1
pkgdesc="udev rules for the LibreCAL, a 4-port eCal module"
arch=('x86_64' 'i686')
url="https://github.com/jankae/LibreCAL"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-charts' 'qt6-svg')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("https://raw.githubusercontent.com/jankae/LibreCAL/main/Software/52-LibreCAL.rules")
sha256sums=('deecc862a8dd255f98cddb793f54f11d4f216d804d674d5f5590849f84afab5a')

# prepare() {
# 	cd "$srcdir/${pkgname}-${pkgver}"
# }

# build() {

# }

package() {
  install -Dm 644 52-LibreCAL.rules ${pkgdir}/etc/udev/rules.d/52-LibreCAL.rules
}
