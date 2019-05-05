# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=0.25.0
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
md5sums=('4d9de1f184d07d60840df9adcf7b1b63'
         '4cdc9f9b3f4945a1e2e29a96004ca5d4'
         'd56001d3a82f412502c883ce56d85cd3')

