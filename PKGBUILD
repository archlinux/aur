# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=numix-cursor-theme
pkgver=1.1
pkgrel=1
pkgdesc="Numix cursor theme for Linux"
arch=('any')
url="https://numixproject.github.io"
license=('GPL3')
source=("https://github.com/numixproject/${pkgname}/releases/download/v${pkgver}/numix-cursor-${pkgver}.tar")
sha256sums=('SKIP')

package() {
  install -dm 755 "${pkgdir}/usr/share/icons"
  cp -dr --no-preserve='ownership' Numix-Cursor{,-Light} "${pkgdir}/usr/share/icons"
}
