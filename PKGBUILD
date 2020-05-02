# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com>
# Maintainer: Noi Sek <noi.t.sek | gmail>

pkgname=lightdm-webkit-theme-aether-git
pkgver=2.2.2
pkgrel=1
pkgdesc="A sleek, customizable Archlinux theme for lightdm."
arch=('any')
url="https://github.com/NoiSek/Aether"
license=('GPL3')
depends=('lightdm' 'lightdm-webkit2-greeter>=2.2.3' 'ttf-opensans')
makedepends=('git')
conflicts=("lightdm-webkit-theme-aether")
source=("git+https://github.com/NoiSek/Aether.git")
md5sums=('SKIP')

package() {
  cd "$pkgdir"
  mkdir -p usr/share/lightdm-webkit/themes/
  rm -rf usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether
  cd usr/share/lightdm-webkit/themes/
  cp -r "$srcdir/Aether" "lightdm-webkit-theme-aether"
}

