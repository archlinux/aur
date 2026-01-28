# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='clownfish'
pkgver=0.1
pkgrel=1
pkgdesc="Clownfish Voice Changer"
arch=('x86_64')
url=https://clownfish-translator.com/voicechanger/
license=('Clownfish''s License')
provides=("$pkgname")
conflicts=("$pkgname")
source_x86_64=("$pkgname-$pkgver.zip::https://clownfish-translator.com/voicechanger/download/ClownfishConsole/linux64/ClownfishConsole(v${pkgver}z).zip")
sha256sums_x86_64=("SKIP")

package() {
  install -d "$pkgdir/usr/bin"
  cp "$srcdir/ClownfishConsole" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/ClownfishConsole" "$pkgdir/usr/bin/$pkgname"
}
