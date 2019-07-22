# Maintainer: Vicente Reyes <vreyesvaldivieso [at] gmail [dot] com>
pkgname=atool-desktop
pkgver=0.1
pkgrel=2
pkgdesc="Desktop Entry for atool-based archive unpacking"
arch=('any')
url="https://github.com/esclerofilo/tiny-utils"
license=()
depends=('atool')
source=("$pkgname.desktop" "$pkgname")
md5sums=('8d461127207d59f6f271c3e2e24374e5'
         '1b569d2c7b0ff4534c143bc9a97e4674')

package() {
  install  -Dm0755 atool-desktop "${pkgdir}/usr/bin/atool-desktop"
  install  -Dm0644 atool-desktop.desktop "${pkgdir}/usr/share/applications/atool-desktop.desktop"
}
