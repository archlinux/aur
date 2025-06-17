pkgname=finkyo-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('abebcb3ba33a0700ce1ab4aaffcf6ce65f04991ec19b00874d96b95e19281d58664d9cc32fc2dea26f7ad68684d36cf739092e38c5ae7ab43a05dd0a1a7ea264')
sha512sums_aarch64=('df10b4d468734fb8d38da01f6d319a3758227302042686c0578f041a589fe0bb30999f23ba8cf9e964d5cbb7721facefb6d7be2b1a0f7e703efdb6f7943fdf1e')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
