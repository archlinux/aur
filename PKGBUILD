# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-remixicon
pkgver=4.6.0
pkgrel=1
pkgdesc="Open source neutral style icon system"
arch=('any')
url="https://remixicon.com"
license=('Apache-2.0')
source=("https://github.com/Remix-Design/RemixIcon/releases/download/v${pkgver}/RemixIcon_Fonts_v${pkgver}.zip")
sha256sums=('da831e147e6c01be824aa7e5929e449c3b7b36170e7b0a851fc9e101e4571385')

package() {
  install -Dm644 fonts/remixicon.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
