# Maintainer: Warinyourself <warinyourself | gmail>

pkgname=lightdm-webkit-theme-osmos
pkgver=1.0.3
pkgrel=1
pkgdesc="A sleek, customizable Archlinux theme for lightdm."
arch=('any')
url="https://github.com/Warinyourself/lightdm-webkit-theme-osmos"
license=('GPL3')
depends=('lightdm' 'lightdm-webkit2-greeter>=2.2.3')
install='lightdm-webkit-theme-osmos.install'
source=("https://github.com/Warinyourself/lightdm-webkit-theme-osmos/releases/download/$pkgver/lightdm-webkit-theme-osmos-$pkgver.tar.gz")
md5sums=('46b2b754d3542cb3a51be20743d320ed')

package() {
  cd "$pkgdir"
  mkdir -p usr/share/lightdm-webkit/themes/
  rm -Rf usr/share/lightdm-webkit/themes/lightdm-webkit-theme-osmos
  cd usr/share/lightdm-webkit/themes/
  cp --recursive "$srcdir" "$pkgname"
}
