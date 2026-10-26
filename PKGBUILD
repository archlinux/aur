pkgname=finkyo-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('8761d88fdac6ffb62d95cc1909b8d4c8760a88c02c86132dd8bdb3fc0aea46b44b8cf69876c28bb8eb0215f16589401e2d9c4f43ede1aab9370395b52c136e7d')
sha512sums_aarch64=('b2f6b712a32bdbb80c11cd93644e8a1c857508abe145f92c5071387b6b6540859935413ad5d81f51764b74de8dd798d7247d3ee2d0cdad719244648e7fe15197')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
