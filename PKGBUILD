# Maintainer: lesebas <sebdeligny at gmail dot com>

pkgname=xame
pkgver=3.0
pkgrel=2
pkgdesc="XFCE Applications Menu Editor"
arch=('any')
url="https://redsquirrel87.altervista.org/doku.php/xfce-applications-menu-editor"
license=('freeware')
depends=('gambas3-gb-gtk3' 'gambas3-gb-form' 'gambas3-gb-image' 'gambas3-gb-form-stock')
optdepends=('gambas3-gb-qt5: if you need the QT support (KDE)')
install='xame.install'
source=(https://bitbucket.org/Red_Squirrel/xfce-applications-menu-editor/downloads/xame-AUR-${pkgver}.tar.gz)
md5sums=('6c2cf6c543a3b68f07bba46cf40aa1ec')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/xame.gambas" "${pkgdir}/usr/bin/xame.gambas"
  ln -s "/usr/bin/xame.gambas" "${pkgdir}/usr/bin/xame" 
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/xame.desktop" "${pkgdir}/usr/share/applications/xame.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/xame.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/xame.png"
}