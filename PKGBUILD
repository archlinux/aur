# Maintainer: Clansty <i@gao4.pw>
pkgname=electron-qq
pkgver=1.2.8
pkgrel=1
pkgdesc='A cross-plantform QQ made with Electron'
license=('GPL')
depends=('electron')
arch=('any')
source=(https://ipfs.io/ipfs/QmQgrm8GN3sUmkLt4vA6Ux6mKXfjuY474mvMaXbGD6e6fA/app.asar
        512x512.png
        electron-qq.desktop)

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "app.asar" "${pkgdir}/usr/lib/${pkgname}.asar"
} 

md5sums=('79ac94f308bea881d9f0d80886cb0c93'
         'f6edfa276c96b746048458413b8c26ce'
         '43e1a2cfd1456d1fb977c9c07d5e7777')
