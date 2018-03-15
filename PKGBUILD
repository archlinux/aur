# Maintainer: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=0.11.1
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
md5sums=('20bd6625605b44fc67820c3e175192fb'
         'f1e85ee5d83cd19ab2ec5281ad8246c9'
         'b42cc398eca7d59bdc80e77408d12236')
