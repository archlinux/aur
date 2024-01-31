# Maintainer: purpleleaf <max@ganoia.eu>
pkgname=dracula-geany-colorscheme
pkgver=1.22.0
pkgrel=1
pkgdesc="Original Dracula Geany colorscheme from draculatheme.com"
url="https://draculatheme.com/geany"
license=("GPL3")
arch=(any)
depends=('geany')
provides=('dracula-geany-colorscheme')
conflicts=('dracula-geany-colorscheme')
source=("$pkgname-$pkgver.zip::https://github.com/dracula/geany/archive/master.zip")
sha512sums=('ae9c73e5908fd70e2f5ad8ee05f955204e791337d9ee983e8102c13a46faf47a071aa13f7f8f1ca68d50dab64a5f1b3d5fabd172dd30e25f0bedd6bdb037cc16')

package() {
  _instdir="$pkgdir/usr/share/geany/colorschemes"
  mkdir -p "$_instdir"
  cp -dp --no-preserve=ownership "$srcdir/geany-master/Dracula-Theme.conf" "$_instdir/"
}
