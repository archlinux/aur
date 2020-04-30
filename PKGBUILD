# Maintainer: simonsmh <simonsmh@gmail.com>
pkgname=okteto-bin
pkgver=1.8.5
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes."
arch=(x86_64 aarch64)
url="https://github.com/okteto/okteto"
license=(Apache)
conflicts=(okteto)
provides=(okteto=$pkgver)
optdepends=(kubectl)
source_x86_64=("okteto::https://github.com/okteto/okteto/releases/download/$pkgver/okteto-Linux-x86_64")
source_aarch64=("okteto::https://github.com/okteto/okteto/releases/download/$pkgver/okteto-Linux-arm64")
sha256sums_x86_64=('c11f2ca195e68039444acb24d16b144478e60b155cc610daffd905003fd99f32')
sha256sums_aarch64=('56f01c29f906115aa8d6e0f1b9587e45fbbc192b39716f2460632d833381f0b1')

package() {
  install -Dm755 "$srcdir/okteto" "$pkgdir"/usr/bin/okteto
}
