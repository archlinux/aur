# Maintainer: FadeMind <fademind@gmail.com>

pkgname=gnome-shell-theme-black
pkgver=20150428
pkgrel=1
pkgdesc="Black GNOME Shell theme"
arch=('any')
url="http://opendesktop.org/content/show.php?content=158356"
license=('GPL3')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("${pkgname}-${pkgver}.tar.lzma::https://copy.com/yf867ODCSJ4jsJfu/${pkgname}-${pkgver}.tar.lzma?download=1")
sha256sums=('30c010215f531a727db532be254b8b8c8a783fe5a6ae7dbf2aceda13a792ecb3')

package() {
  install -dm755 ${pkgdir}/usr/share/themes
  cp -rf Black{,-HIDPI*} ${pkgdir}/usr/share/themes
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
