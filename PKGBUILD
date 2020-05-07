# Maintainer: simonsmh <simonsmh@gmail.com>
pkgname=okteto-bin
pkgver=1.8.6
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
sha256sums_x86_64=('72b09fb5e8e426125e14bd0d9018dd6964beda846934eece6e71d4c6cd899ea6')
sha256sums_aarch64=('dad82df1dfc1b733cbc1a1a0d2ef211ccb8027817337c838ad7f62e638609c72')

package() {
  install -Dm755 "$srcdir/okteto" "$pkgdir"/usr/bin/okteto
}
