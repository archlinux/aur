# Maintainer: Abigail G <me@kb6.ee>

pkgname=ttf-marketingscript
pkgver=1
pkgrel=3
pkgdesc="Marketing Script Font Family"
url="https://www.1001fonts.com/marketing-script-font.html"
arch=(any)
license=(custom)
source=("https://dl.1001fonts.com/marketing-script.zip")
sha256sums=("dbb9277578343e3a81ea8368fb7c6402396a85e80ccf1241217a7007581fb16e")

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -t "$pkgdir/usr/share/fonts/TTF" -m644 *.ttf
  install -Dm644 1001fonts-marketing-script-eula.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

