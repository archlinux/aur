# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=nitro-bin
pkgver=30.0.0
pkgrel=1
pkgdesc="An incredible, beautiful, and feature-rich GraphQL IDE"
url="https://chillicream.com/products/nitro/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.chillicream.com/app/Nitro-$pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("55f40a6223b34263e223f79b7ff46b959efb7862391b9c30336df7199dbc28765a008dfb7dfb1b7960e538e6863a96e40d8f7d25084169bc7643f0af4310f348"
        "2de3f8321794c97dd62ba6b4ccae367fa101d90578675e89104f80dd74188eaf2f5fe2c70979e0d2717fe4599b74f32275c3d501272a80f0b47e8eeacc7fa8b9")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "Nitro-$pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/nitro"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
