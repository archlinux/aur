pkgname=finkyo-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('b330c247d6e4925f9625cd8d25d9132a655671c690cb11ca6c98e438ba1960ea5b31d3a132e39549f8fa0ff2c10541b668b1fb0053d86e64bf521fd6b9176908')
sha512sums_aarch64=('a771a0d2c37071a9ee9c549e089b71b5ee57e130f5e6c2b16da40da071e7c135287f8fdd6fb14d3588a98b54cabb21af768d5961d7f8aad2e1341794bef26aef')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
