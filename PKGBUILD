# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ttk-themes-breeze"
pkgver=0.6
pkgrel=1
pkgdesc="Tk version of Breeze and Breeze Dark themes"
url="https://github.com/thindil/tkBreeze"
arch=("any")
license=("custom:none")
depends=("tcl" "tk")
optdepends=("ttk-theme-chooser")
conflicts=("ttk-themes")
source=("$pkgname-$pkgver.tar.gz::https://github.com/thindil/tkBreeze/archive/cb7dd7f75f06a3a97c43690d0ba45bb0567b5b85.tar.gz")
sha256sums=('f638ec0ede117fe09970e551d8f630e1b221ef65a01601b613593002d2cf690e')
install="ttk-themes-breeze.install"
options=("!strip")

package(){
 cd "tkBreeze"
 mkdir -p "$pkgdir/usr/lib/ttkthemes"
 cp -r "breeze"* "$pkgdir/usr/lib/ttkthemes/"
 install -D -m 664 "pkgIndex.tcl" -t "$pkgdir/usr/lib/ttkthemes"
}
