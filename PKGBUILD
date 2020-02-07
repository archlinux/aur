# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=1.0.0
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
sha256sums=('ec064a5edd2a2a210cf8162305869a27b3ed6c7e50caa70687bc9d72177f61f3'
            '146ef6f68d1626f0260fdadfd0128c26eb53908b8eb347a69214af6a43dab2e0'
            'be1369549d405c25f2346bcdf8d88f4eb36dd79583eabf1e11b39970d5ed6e0c')

