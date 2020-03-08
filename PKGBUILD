# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=2.0.0
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
sha256sums=('fcead76be04a8aabd86d1190887cb8f290358d075177f329bdf07ab4e363c54d'
            'ad002a8d79446b2f704d48f8f602d5a09c87ab054072f4aefc71540c5be384b3'
            'b2aa2f534ae95926de7255560c03cf292737c49f86e906edadea75c9030e9429')

