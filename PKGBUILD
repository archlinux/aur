# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=numix-cursor-theme
pkgver=1.2
pkgrel=1
pkgdesc="Numix cursor theme for Linux"
arch=('any')
url="https://numixproject.github.io"
license=('GPL3')
source=("https://github.com/numixproject/${pkgname}/releases/download/v${pkgver}/numix-cursor-${pkgver}.tar")
b2sums=('87d96c661f54da55dd4da953702344c50e35fe91d84b3cdcea8bb87f5c9a8f0ac670f6357dcc1165d693ef23e0dc543e50652e8362c581538dd3ee0695407bd2')

package() {
  install -dm 755 "${pkgdir}/usr/share/icons"
  cp -dr --no-preserve='ownership' Numix-Cursor{,-Light} "${pkgdir}/usr/share/icons"
}
