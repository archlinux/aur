# Maintainer: FadeMind <fademind@gmail.com>

pkgname=gnome-shell-theme-elementary-mod
pkgver=20150524
pkgrel=1
pkgdesc="Elementary Mod GNOME Shell theme."
arch=('any')
url="http://opendesktop.org/content/show.php?content=147378"
license=('GPL3')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("${pkgname}-${pkgver}.tar.lzma::https://copy.com/QiAV4lBnxTWsoqBC/${pkgname}-${pkgver}.tar.lzma?download=1")
sha256sums=('ecc426c5562f5713f035547355841601bccf317445a6d05dd3546d5c5f2016e5')

package() {
  install -dm755 ${pkgdir}/usr/share/themes
  cp -rf Elementary* ${pkgdir}/usr/share/themes
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
