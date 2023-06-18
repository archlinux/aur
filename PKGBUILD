# Maintainer : MorsMortium <morsmortium@disroot.org>

pkgname=0x0uploader
pkgver=1.1
pkgrel=1
pkgdesc='Uploader for the 0x0 file sharing service.'
arch=('any')
url="https://codeberg.org/MorsMortium/${pkgname}"
license=('GPL3')
conflicts=('0x0uploader')
depends=('bash' 'curl')
optdepends=('xclip: X clipboard'
    'wl-clipboard: Wayland clipboard'
    'libnotify: Notifications')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/MorsMortium/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('a06c5a99d5527d6caae1c92ed2098acbf51b378f')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ${pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm 755 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
