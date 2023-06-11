# Maintainer : MorsMortium <morsmortium@disroot.org>

pkgname=0x0uploader
pkgver=1.0
pkgrel=1
pkgdesc='Uploader for the 0x0 file sharing service.'
arch=('any')
url="https://codeberg.org/MorsMortium/${pkgname}"
license=('GPL-3.0')
depends=('bash' 'curl')
optdepends=('xclip: X clipboard'
    'wl-clipboard: Wayland clipboard'
    'libnotify: Notifications')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/MorsMortium/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('7e8855ed64dacb6d4b80af96e90017cba17ec285')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ${pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm 755 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
