# Maintainer: Safwan Ljd <eljadisafwan@gmail.com>

pkgname=bettergruvbox-gtk-theme
pkgver=1.0
pkgrel=1
pkgdesc="An Elegant Dark Gruvbox GTK Theme, With a Green Accent"
arch=(any)
url="https://github.com/SafwanLjd/BetterGruvbox"
license=('GPL3')
depends=('gtk-engine-murrine')
source=("https://github.com/SafwanLjd/BetterGruvbox/releases/download/$pkgver/$pkgname.tar.gz")
sha1sums=('449763b0868f092b95d12c8f9571655d23a70418')

package() {
  install -d "$pkgdir/usr/share/themes/BetterGruvbox"
  cp -rv ${srcdir}/BetterGruvbox/* "$pkgdir/usr/share/themes/BetterGruvbox"
}
