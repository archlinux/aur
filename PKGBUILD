# Maintainer: Clansty <i@gao4.pw>
pkgname=electron-qq
pkgver=1.4.4
pkgrel=1
pkgdesc='A cross-platform QQ made with Electron'
license=('GPL')
depends=('electron12')
optdepends=('mongodb-bin: provides faster storage')
arch=('any')
source=("app-${pkgver}.asar::https://files.catbox.moe/oq5f7y.asar"
        512x512.png
        ${pkgname}.desktop
        ${pkgname})

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "app-${pkgver}.asar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.asar"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
} 

md5sums=('baea94885e10ac6843132fd155d967a0'
         'f6edfa276c96b746048458413b8c26ce'
         '77bdf165bded76c2bac542402e8fe35c'
         'fa0e38c1bf689edcc75a9a3335a6be18')
