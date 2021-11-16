# Maintainer: stan754 <stan@omg.lol>
pkgname=omglol-profiler
pkgver=0.0.2
pkgrel=1
pkgdesc='A profile designer for omg.lol'
url="https://github.com/themes-omgdotlol/designer-app"
license=('MIT')
depends=('electron')
makedepends=('git')
arch=('any')
source=(app.asar
        512x512.png
        Profiler.desktop)
source=('designer-app::git://github.com/themes-omgdotlol/designer-app.git')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "designer-app/pkgbuild/${pkgname}.desktop"
  install -Dm644 "designer-app/pkgbuild/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "designer-app/pkgbuild/app.asar" "${pkgdir}/usr/lib/${pkgname}.asar"
}

md5sums=('SKIP') 
