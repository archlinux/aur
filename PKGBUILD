# Maintainer: Safwan Ljd <eljadisafwan@gmail.com>

pkgname=bettergruvbox-gtk-theme
pkgver=1.0
pkgrel=1
pkgdesc="An Elegant Dark Gruvbox GTK Theme, With a Green Accent"
arch=(any)
url="https://gitlab.com/SafwanLjd/BetterGruvbox"
license=('GPL3')
depends=('gtk-engine-murrine')
source=("https://gitlab.com/SafwanLjd/BetterGruvbox/-/archive/v$pkgver/BetterGruvbox-v$pkgver.tar.gz")
sha1sums=('2e6908b70295127313dba3b16e23b48bcbf97b42')

package() {
  install -d "$pkgdir/usr/share/themes/BetterGruvbox"
  cp -rv "${srcdir}/BetterGruvbox-v$pkgver/*" "$pkgdir/usr/share/themes/BetterGruvbox"
}
