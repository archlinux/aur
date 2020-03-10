# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=2.2.0
pkgrel=1
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache')
pkgdesc="Developer tools for working with Google's bazel buildtool."
optdepends=('bazel: the build tool to work with')
source=("https://github.com/bazelbuild/buildtools/releases/download/$pkgver/buildifier"
  "https://github.com/bazelbuild/buildtools/releases/download/$pkgver/buildozer"
  "https://github.com/bazelbuild/buildtools/releases/download/$pkgver/unused_deps")
package() {
  install -d "$pkgdir"/usr/bin
  install -Dm755 buildifier buildozer unused_deps $pkgdir/usr/bin/
}
sha256sums=('4a1f6d5388175ed4ef41376b0532917e2bc179318921ad01d8d0edf7b09ec603'
            '1fec52159253694e012ec1ce81675a8b8118abf04b40825c27f26fa920bd4bbc'
            '2c2a8774730e71a0303b618f2ee56d97330b6e8f7704a206e5ffa1be71c7c9ca')

