# Maintainer: Julien Savard <juju@juju2143.ca>

pkgname=noto-fonts-emoji-flags
pkgver=20200120
pkgrel=1
pkgdesc="Google Noto emoji fonts with more regional flags"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:OFL)
provides=(emoji-font)
source=($pkgname-$pkgver.zip::"https://github.com/juju2143/noto-emoji/archive/$pkgver.zip")
sha256sums=('0163b6b7f5ff219ced8f483b4c827284c2000e373565ca6ef8309b2bf7f9727f')

package() {
  cd "noto-emoji-$pkgver"
  mkdir -p "$pkgdir"/usr/share/fonts/noto-flags
  install -m644 fonts/NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto-flags/NotoColorEmoji.ttf
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
