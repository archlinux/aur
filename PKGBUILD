pkgname=finkyo-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('72e81697dc240dd215151e4c4806f728dd8b88f4bb1c7db9d3fb5992fb0b1c6f7768d75ce54afc394201e2cfbfc489e4fd1af03ff0e8462574d3a95a3fb61907')
sha512sums_aarch64=('f6ddb9d7f0e206f994fba664636c6d1f195489dc38cc55b79e7be82f7bbac84be174d6ef12014e0145f5964c76c5aee5f40fe99c74b6109f673cbb9acae743fb')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
