# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-remixicon
pkgver=4.4.0
pkgrel=1
pkgdesc="Open source neutral style icon system"
arch=('any')
url="https://remixicon.com"
license=('Apache-2.0')
source=("https://github.com/Remix-Design/RemixIcon/releases/download/v${pkgver}/RemixIcon_Fonts_v${pkgver}.zip")
sha256sums=('8c12ad1c67762af6fa8c97d6580c8661e20f00030cb41550bf1961d314e11e1a')

package() {
  install -Dm644 fonts/remixicon.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
