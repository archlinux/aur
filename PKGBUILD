# Maintainer: Boof2015 <contact@novaml.ai>
pkgname=astra-music-bin
pkgver=0.4.0.beta
pkgrel=1
pkgdesc="Audiophile music player with advanced visualization"
arch=('x86_64')
url="https://github.com/Boof2015/astra"
license=('GPL-3.0-only')
provides=('astra')
conflicts=('astra')
source=("astra-0.4.0.beta.AppImage::https://github.com/Boof2015/astra/releases/download/v0.4.0-beta/Astra-0.4.0-beta-Linux.AppImage")
sha256sums=('SKIP')

package() {
  install -Dm755 "astra-${pkgver}.AppImage" "${pkgdir}/opt/astra/astra.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/astra/astra.AppImage "${pkgdir}/usr/bin/astra"
}
