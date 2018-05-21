# Maintainer: Noi Sek <noi.t.sek | gmail>

pkgname=lightdm-webkit-theme-aether
pkgver=2.2.0
pkgrel=1
pkgdesc="A sleek, customizable Archlinux theme for lightdm."
arch=('any')
url="https://github.com/NoiSek/Aether"
license=('GPL3')
depends=('lightdm' 'lightdm-webkit2-greeter>=2.2.3' 'ttf-opensans')
install='lightdm-webkit-theme-aether.install'
changelog='changelog.txt'
source=("https://github.com/NoiSek/Aether/archive/v$pkgver.tar.gz")
md5sums=('41384e1ce80072b880a44a0f10ff4150')

package() {
  cd "$pkgdir"
  mkdir -p usr/share/lightdm-webkit/themes/
  rm -Rf usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether
  cd usr/share/lightdm-webkit/themes/
  cp --recursive "$srcdir/Aether-$pkgver" "$pkgname"
}

