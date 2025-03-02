# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=nitro-bin
pkgver=24.0.3
pkgrel=1
pkgdesc="An incredible, beautiful, and feature-rich GraphQL IDE"
url="https://chillicream.com/products/nitro/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.chillicream.com/app/Nitro-$pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("3ced8e1ffe3ea2d037302b370ef612070faefe9600cdab82f74116ccfca0f6403b033511c191a1bb75b03520e79ebed2f5a8f6b8cb3b98b9db0c917ee63aa674"
        "2de3f8321794c97dd62ba6b4ccae367fa101d90578675e89104f80dd74188eaf2f5fe2c70979e0d2717fe4599b74f32275c3d501272a80f0b47e8eeacc7fa8b9")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "Nitro-$pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/nitro"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
