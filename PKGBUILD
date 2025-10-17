# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-remixicon
pkgver=4.7.0
pkgrel=1
pkgdesc="Open source neutral style icon system"
arch=('any')
url="https://remixicon.com"
license=('Apache-2.0')
source=("https://github.com/Remix-Design/RemixIcon/releases/download/v${pkgver}/RemixIcon_Fonts_v${pkgver}.zip")
sha256sums=('041f50ead5dfc7fb2dc6119a46bcef75861db078d76123c3ba2fb7ea09d1bd29')

package() {
  install -Dm644 fonts/remixicon.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
