# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-remixicon
pkgver=4.1.0
pkgrel=1
pkgdesc="Open source neutral style icon system"
arch=('any')
url="https://remixicon.com/"
license=('Apache-2.0')
source=("https://github.com/Remix-Design/RemixIcon/releases/download/v${pkgver}/RemixIcon_Fonts_v${pkgver}.zip")
sha256sums=('d3856ca604b301a2e2df12b98cb1ad4124e2e9ecf85db33c1aa1c015ce93f300')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" fonts/remixicon.ttf
}
