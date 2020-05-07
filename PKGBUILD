# Maintainer: simonsmh <simonsmh@gmail.com>
pkgname=okteto-bin
pkgver=1.8.7
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
sha256sums_x86_64=('54bd9617108be3c359336ff0e424d921a35a39bfe317f4824646436547152000')
sha256sums_aarch64=('99b72fb835b04c8c6d7213a4e7df98385da4680ce9f38beff53576cd22a26134')

package() {
  install -Dm755 "$srcdir/okteto" "$pkgdir"/usr/bin/okteto
}
