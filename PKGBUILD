# Maintainer: Warinyourself <warinyourself | gmail>

pkgname=lightdm-webkit-theme-osmos
pkgver=1.0.4
pkgrel=1
pkgdesc="A sleek, customizable Archlinux theme for lightdm."
arch=('any')
url="https://github.com/Warinyourself/lightdm-webkit-theme-osmos"
license=('GPL3')
depends=('lightdm' 'lightdm-webkit2-greeter>=2.2.3')
install='lightdm-webkit-theme-osmos.install'
source=("$url/archive/$pkgver.tar.gz")
md5sums=('e106fbbadd9caff09e34440a158e6fb9')

package() {
  cd "$pkgdir"
  mkdir -p usr/share/lightdm-webkit/themes/
  rm -Rf usr/share/lightdm-webkit/themes/lightdm-webkit-theme-osmos
  cd usr/share/lightdm-webkit/themes/
  cp --recursive "$srcdir" "$pkgname"
}
