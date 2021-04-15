# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-sans-classic-fonts
pkgver=2.003
pkgrel=1
pkgdesc='Adobe Source Han Sans fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-sans-classic"
license=('custom:OFL')
source=("https://github.com/redchenjs/source-han-sans-classic/releases/download/$pkgver/source-han-sans-classic-otf.zip")
sha512sums=('6c9c99fe272092b3939bd11510be421401a8ea2a2657172bba0f254d7474271c21407e1b8313b88dd741667dbd68088dae694579003ff4184f0148209c2ea50f')

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
