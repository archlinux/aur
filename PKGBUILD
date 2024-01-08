# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=bananacakepop-bin
pkgver=14.0.0
pkgrel=1
pkgdesc="A powerful GraphQL IDE that joins you and your team on your GraphQL journey."
url="https://chillicream.com/products/bananacakepop/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.bananacakepop.com/app/BananaCakePop-$pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("6fa14b5353efaf95660f69c63a4b7e3de6c091eff9c29306dbf6e7ee852076b2cad69d4b1551b9e66bb2e4b11b8216f429de2625d11606908507331967c609e6"
        "65c1186762988ba427d42dc746f97aa9a7ceabc245570aeab701752e675ffec82c4f3718f4f4a116cc92e967bc38cae5df1baf5eb053da045bf2a122de2aeaf6")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "BananaCakePop-$pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/bananacakepop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
