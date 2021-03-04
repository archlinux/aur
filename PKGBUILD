# Maintainer: Clansty <i@gao4.pw>
pkgname=electron-qq
pkgver=1.2.6
pkgrel=1
pkgdesc='A cross-plantform QQ made with Electron'
license=('GPL')
depends=('electron')
arch=('any')
source=(https://cf-ipfs.com/ipfs/QmbC2bskvv8hrpcLk4S8tr5dvccyb86h8iTYoAh3P8Gxja/app.asar
        512x512.png
        electron-qq.desktop)

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "app.asar" "${pkgdir}/usr/lib/${pkgname}.asar"
} 

md5sums=('8362e12987829f76f9146b0fedbe1660'
         'f6edfa276c96b746048458413b8c26ce'
         '43e1a2cfd1456d1fb977c9c07d5e7777')
