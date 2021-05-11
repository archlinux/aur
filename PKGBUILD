pkgname=watchit
_pkgver=0.1.0-beta.10
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Watch movies everywhere"
arch=('x86_64')
url="http://watchitapp.site"
license=('LGPL3')
depends=('libxss' 'nss' 'gtk3')
source=("https://github.com/ZorrillosDev/watchit-desktop/releases/download/v$_pkgver/${pkgname%-bin}_${_pkgver}_amd64.deb")
 
package() {
    bsdtar xvf data.tar.xz -C "$pkgdir"
 
    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/watchit/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
 
   # install -d "$pkgdir/usr/share/pixmaps"
    #mv "$pkgdir/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" \
   #     "$pkgdir/usr/share/pixmaps"
    #rm -rf "$pkgdir/usr/share/icons"
    #rm -rf "$pkgdir/usr/share/doc"
}

sha256sums=('e62446518ac2613f03e656ac544b67adca84147706f8857270685fd9fe144665')
sha512sums=('fe11c7063d9f8b6dacb23c288b6b23a779b6f6a63849c7d5ae1b0edb7b2e2a82703227228021eb75b3225b393e43fc059abafe0e94ad5e176e0f8425837ce5f4')
b2sums=('db33b24a14ee97ad6c87e9c91c04ea4242763a5da8b554c6b6357157bea69a9979ca469f050bfcfd073031a44e5a82ee02872c22a97ba9fa1fc9fbcf3f23c7d8')
