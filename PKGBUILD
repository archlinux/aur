# Maintainer: simonsmh <simonsmh@gmail.com>
pkgname=okteto-bin
pkgver=1.8.4
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
sha256sums_x86_64=('e59845ecbc12eed96cff7f2750819fcb1d4d29ec3cd67ed2270af48cff376e95')
sha256sums_aarch64=('a9f6ec6f02d0f9926c399987f00072a71aaa0226a953c5cbc1eb336d3bedcc53')

package() {
  install -Dm755 "$srcdir/okteto" "$pkgdir"/usr/bin/okteto
}
