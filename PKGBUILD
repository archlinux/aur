# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-sans-classic-fonts
pkgver=2.003
pkgrel=1
pkgdesc='Adobe Source Han Sans fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-sans-classic"
license=('custom:OFL')
source=("https://github.com/redchenjs/source-han-sans-classic/releases/download/$pkgver/source-han-sans-classic-otf.zip")
sha512sums=('22857b8c440919f9b33d2083fc3071ba8a658d7350394a9604f1ad7dff7097a78c9ba3d062fa3942cf02ea90566c3dd831b94e4b71d0ed771a71d677ee33637f')

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
