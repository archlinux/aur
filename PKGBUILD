# Maintainer: simonsmh <simonsmh@gmail.com>
pkgname=okteto-bin
pkgver=1.8.8
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
sha256sums_x86_64=('ebc57882c88083d63e34f92929dca2337b6f159c65507d7c906e5e5d1be69f47')
sha256sums_aarch64=('b37d077f26a596af50f3686f64cae64e32aaf3a53e8bd2e2e5bfaaf8a1dc5f83')

package() {
  install -Dm755 "$srcdir/okteto" "$pkgdir"/usr/bin/okteto
}
