# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=0.22.0
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
md5sums=('3aa742a8364c0a55c8cf8e0d979a9e89'
         '2521c3d6de32387113e248f0cded6ece'
         '1c57c02cf5962b0b66292371601a6b08')

