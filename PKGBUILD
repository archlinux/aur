# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazel-buildtools
pkgver=0.11.1
pkgrel=2
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
md5sums=('aae6e0cc5249e5468e8f103097c08919'
         '9e2f79e043960e6dd2dbd17676e46466'
         '95f2df2d9682230b68b996936e432c94')

