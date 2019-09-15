# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=0.29.0
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
md5sums=('da6ef4cb59fe385af229d462f58b5d71'
         '77f030abdd776b2e61cf2dd6d50a2ce0'
         '06546e4c6e12d27fb72899a9888f915c')

