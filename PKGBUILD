# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=bananacakepop-bin
pkgver=13.0.0
pkgrel=1
pkgdesc="A powerful GraphQL IDE that joins you and your team on your GraphQL journey."
url="https://chillicream.com/products/bananacakepop/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.bananacakepop.com/app/BananaCakePop-$pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("b1cdc33cbcc5fc07c0aed9705d6e6a192ec0c8830b2d9983db0bab1c985613a0e8344a5798ee12c6b7cd84143a86e0d8498f8b0138ae97cd12d307ac28c7facb"
        "65c1186762988ba427d42dc746f97aa9a7ceabc245570aeab701752e675ffec82c4f3718f4f4a116cc92e967bc38cae5df1baf5eb053da045bf2a122de2aeaf6")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "BananaCakePop-$pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/bananacakepop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
