# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgname=ttf-libron
pkgver=0.25
pkgrel=1
pkgdesc="Serif typeface tuned for digital reading and e-readers (Readerly fork)"
arch=('any')
url="https://github.com/nicoverbruggen/libron"
license=('OFL-1.1')
depends=()
source=("ttf-libron-$pkgver.zip::https://github.com/nicoverbruggen/libron/releases/download/v$pkgver/Libron.zip"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/nicoverbruggen/libron/v$pkgver/LICENSE"
  "COPYRIGHT-$pkgver::https://raw.githubusercontent.com/nicoverbruggen/libron/v$pkgver/COPYRIGHT")
sha256sums=('a732102b75e6016ae52d39ec22e182bc89365612c906b5898bcd1f8e02b91a57'
  'cb452a7a6e43d36823b393e6fa2cb1b60fccb4533bb30dc96d7262df5dbb477e'
  'f266cfea9e68f3a159788da9ecda72e3fa14d76816c0fca30442496b6253e12e')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir"/Libron-*.ttf

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "COPYRIGHT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
