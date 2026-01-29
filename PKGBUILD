# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-remixicon
pkgver=4.9.0
pkgrel=1
pkgdesc="Open source neutral style icon system"
arch=('any')
url="https://remixicon.com"
license=('Apache-2.0')
source=("https://github.com/Remix-Design/RemixIcon/releases/download/v${pkgver}/RemixIcon_Fonts_v${pkgver}.zip")
sha256sums=('b9dc5263ea5e5de71a1b030edb9b9c55234a21d157ac11de91c16175f7a6e06c')

package() {
  install -Dm644 fonts/remixicon.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
