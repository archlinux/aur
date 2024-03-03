# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=bananacakepop-bin
pkgver=15.0.2
pkgrel=1
pkgdesc="A powerful GraphQL IDE that joins you and your team on your GraphQL journey."
url="https://chillicream.com/products/bananacakepop/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.bananacakepop.com/app/BananaCakePop-$pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("159f3d3602a974a62df182a3e6123993a0fe8b458d4d2ccee2407d56a562e4c38aa10c040723652dfb7f8031af7830c03782a9cd31a945531ead3c44b2312948"
        "65c1186762988ba427d42dc746f97aa9a7ceabc245570aeab701752e675ffec82c4f3718f4f4a116cc92e967bc38cae5df1baf5eb053da045bf2a122de2aeaf6")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "BananaCakePop-$pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/bananacakepop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
