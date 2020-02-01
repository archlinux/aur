# Maintainer: Warinyourself <warinyourself | gmail>

pkgname=lightdm-webkit-theme-osmos
pkgver=1.0.5
pkgrel=1
pkgdesc="A sleek, customizable Archlinux theme for lightdm."
arch=('any')
url="https://github.com/Warinyourself/lightdm-webkit-theme-osmos"
license=('GPL3')
depends=('lightdm' 'lightdm-webkit2-greeter>=2.2.3')
install='lightdm-webkit-theme-osmos.install'
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('dfbfb83d45ae83c08c059615435f8a5c')

package() {
  cd "$pkgdir"
  mkdir -p usr/share/lightdm-webkit/themes/
  rm -Rf usr/share/lightdm-webkit/themes/lightdm-webkit-theme-osmos
  cd usr/share/lightdm-webkit/themes/
  cp -r --recursive "$srcdir" "$pkgname"
}
md5sums=('dfbfb83d45ae83c08c059615435f8a5c')
