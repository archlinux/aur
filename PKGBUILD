# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-remixicon
pkgver=4.9.1
pkgrel=1
pkgdesc="Open source neutral style icon system"
arch=('any')
url="https://remixicon.com"
license=('Apache-2.0')
source=("https://github.com/Remix-Design/RemixIcon/releases/download/v${pkgver}/RemixIcon_Fonts_v${pkgver}.zip")
sha256sums=('f27090f8e1a3fed59367c2da1abb55ae074114cc4006e364e2d1baba546a71bb')

package() {
  install -Dm644 fonts/remixicon.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
