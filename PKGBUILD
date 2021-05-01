# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-mono-classic-fonts
pkgver=1.002
pkgrel=8
pkgdesc='Adobe Source Han Mono fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-mono-classic"
license=('custom:OFL')
source=($pkgver-$pkgrel.zip::"https://github.com/redchenjs/source-han-mono-classic/releases/download/$pkgver/SourceHanMonoC-OTF.zip")
sha512sums=('7b02b5d0252dd3076405f23659e26192dda6a2e330d00f935d9d05014afcf27b45aac82b8a6bc846796abf695ab0e50d8f1fff0728ee057cd4f9037aab0f0762')

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
