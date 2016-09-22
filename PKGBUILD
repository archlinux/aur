# Maintainer: Noi Sek <noi.t.sek | gmail>

pkgname=lightdm-webkit-theme-aether
pkgver=1.2.1
pkgrel=2
pkgdesc="A sleek, straightforward Archlinux theme for lightdm."
arch=('any')
url="https://github.com/NoiSek/Aether"
license=('GPLv2')
depends=('lightdm' 'lightdm-webkit2-greeter')
install='lightdm-webkit-theme-aether.install'
changelog='changelog.txt'
source=("https://github.com/NoiSek/Aether/archive/v$pkgver.tar.gz")
md5sums=('0c5771274264d3c377a565573f8e073f')

package() {
  cd "$pkgdir"
  mkdir -p usr/share/lightdm-webkit/themes/
  cd usr/share/lightdm-webkit/themes/
  cp --recursive "$srcdir/Aether-$pkgver" "$pkgname"
}
