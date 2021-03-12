# Maintainer: Clansty <i@gao4.pw>
pkgname=electron-qq
pkgver=1.3.0_rc
pkgrel=1
pkgdesc='A cross-plantform QQ made with Electron'
license=('GPL')
depends=('electron')
arch=('any')
source=("app.asar::https://ipfs.io/ipfs/Qmbh3Cpmrd5Zvmiw14JdCjsVH2rwJg7FQgUjAANyJ2qMAB"
        512x512.png
        electron-qq.desktop)

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "app.asar" "${pkgdir}/usr/lib/${pkgname}.asar"
} 

md5sums=('3832467503a1a3b3c42685b884927b27'
         'f6edfa276c96b746048458413b8c26ce'
         '43e1a2cfd1456d1fb977c9c07d5e7777')
