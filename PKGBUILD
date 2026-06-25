# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=nitro-bin
pkgver=31.0.3
pkgrel=1
pkgdesc="An incredible, beautiful, and feature-rich GraphQL IDE"
url="https://chillicream.com/products/nitro/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.chillicream.com/app/Nitro-$pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("430ce5bda4e2f4b9a92f27c8a3fe53fa8d405a52fc544a78628cbb47eadfae30489aae06563166a6b794ed5931f06777d395a8835425631da8c2a6ba18bd272f"
        "2de3f8321794c97dd62ba6b4ccae367fa101d90578675e89104f80dd74188eaf2f5fe2c70979e0d2717fe4599b74f32275c3d501272a80f0b47e8eeacc7fa8b9")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "Nitro-$pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/nitro"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
