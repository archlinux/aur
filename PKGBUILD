# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=nitro-bin
pkgver=28.0.13
pkgrel=1
pkgdesc="An incredible, beautiful, and feature-rich GraphQL IDE"
url="https://chillicream.com/products/nitro/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.chillicream.com/app/Nitro-$pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("a417068e5764bc450834a5bcec9ba227b53c347e8a1e607c8ed9e9dd18f379b12676d313c4d1ea49a0bc1c25ee41c2cecb984f9ff9c268495c73bd33fbb7c553"
        "2de3f8321794c97dd62ba6b4ccae367fa101d90578675e89104f80dd74188eaf2f5fe2c70979e0d2717fe4599b74f32275c3d501272a80f0b47e8eeacc7fa8b9")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "Nitro-$pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/nitro"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
