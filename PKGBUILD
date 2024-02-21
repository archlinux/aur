# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=bananacakepop-bin
pkgver=15.0.1
pkgrel=1
pkgdesc="A powerful GraphQL IDE that joins you and your team on your GraphQL journey."
url="https://chillicream.com/products/bananacakepop/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.bananacakepop.com/app/BananaCakePop-$pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("37b6dce5fcbe33565c84f7cc8f6bcae33be186f158824a6085a851e9042cc797471f8c19752b796d2fa5f9a787a78f90414480c7d2a03e67908d783a59194487"
        "65c1186762988ba427d42dc746f97aa9a7ceabc245570aeab701752e675ffec82c4f3718f4f4a116cc92e967bc38cae5df1baf5eb053da045bf2a122de2aeaf6")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "BananaCakePop-$pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/bananacakepop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
