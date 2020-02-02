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
md5sums=('70577af536e7c50a0e5407065cf36db5')

package() {
  cd "$pkgdir"
  mkdir -p usr/share/lightdm-webkit/themes/
  rm -Rf usr/share/lightdm-webkit/themes/lightdm-webkit-theme-osmos
  cd usr/share/lightdm-webkit/themes/
  cp -r --recursive "$srcdir" "$pkgname"
}
md5sums=('70577af536e7c50a0e5407065cf36db5')
