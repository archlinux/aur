# Maintainer: Texman Productions
pkgname=flashforgemonitor
pkgver=1.0.0rc1
pkgrel=1
pkgdesc='Native Linux desktop monitor and controller for Flashforge Creator 5-series printers'
arch=('any')
url='https://github.com/RokenPrice/flashforgemonitor'
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'mpv')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RokenPrice/flashforgemonitor/archive/refs/tags/v1.0.0-rc1.tar.gz")

sha256sums=('494dab47eebaea63a66c3482f3ca267696163c7ec5319b46ce07709ea308ff18')

package() {
  cd "${srcdir}/${pkgname}-1.0.0-rc1"

  install -Dm755 flashforgemonitor "${pkgdir}/usr/bin/flashforgemonitor"
  install -Dm644 Artwork/creator_5.png "${pkgdir}/usr/share/flashforgemonitor/Artwork/creator_5.png"
  install -Dm644 Artwork/creator_5_pro.png "${pkgdir}/usr/share/flashforgemonitor/Artwork/creator_5_pro.png"
  install -Dm644 flashforgemonitor.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/flashforgemonitor.svg"
  install -Dm644 flashforgemonitor.desktop "${pkgdir}/usr/share/applications/flashforgemonitor.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 config.example.json "${pkgdir}/usr/share/doc/${pkgname}/config.example.json"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
