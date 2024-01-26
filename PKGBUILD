# Maintainer: purpleleaf <max@ganoia.eu>
pkgname=dracula-icons-theme
pkgver=4.0.0
pkgrel=1
pkgdesc="Original Dracula icon theme from draculatheme.com"
url="https://draculatheme.com/gtk"
license=("GPL3")
arch=(any)
depends=()
provides=('dracula-icons')
conflicts=('dracula-icons')
source=("$pkgname-$pkgver.zip::https://github.com/dracula/gtk/files/5214870/Dracula.zip")
sha512sums=('da806eaf78b3a96fec83df075543425c19b15ce75c916bf02f65eac3f1c64706184fd4be025c0bdfee918e18999a026a3eca09246b7d08bb00103d8203e507b0')

package() {
  _instdir="$pkgdir/usr/share/icons"
  mkdir -p "$_instdir"
  cp -dpr --no-preserve=ownership "$srcdir/Dracula" "$_instdir/Dracula"
}
