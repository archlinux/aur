pkgname=finkyo-bin
pkgver=0.4.5.1
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('2460f50d5c83cd9e7ab09fdd622ec3fd7c46529d95c844eb728b79620a6d9808de80e087f034655f74424a74e44122042edc8ae9e6a6e56a8299885cfe5e432f')
sha512sums_aarch64=('11ae79710853bcca41eca052e5d51741a0815cdf38221dce9a28e7f7ae47a5457b702f4ca4a392222c490712f5ae41eee0a2cd6ad97bc60a7d6559dab119c669')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
