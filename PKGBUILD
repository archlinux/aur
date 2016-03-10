# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Maurice Box <m-ou.se@m-ou.se>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-clang
pkgver=1
pkgrel=1
pkgdesc="Symlinks for the clang toolchain for CloudABI."
url='http://clang.llvm.org/'
arch=('any')
depends=(
	'clang>=3.7'
)
license=(custom:LLVM)

package() {
	install -d "$pkgdir/usr/bin"
	ln -s clang "$pkgdir/usr/bin/x86_64-unknown-cloudabi-cc"
	ln -s clang "$pkgdir/usr/bin/x86_64-unknown-cloudabi-c++"
	ln -s clang "$pkgdir/usr/bin/aarch64-unknown-cloudabi-cc"
	ln -s clang "$pkgdir/usr/bin/aarch64-unknown-cloudabi-c++"
}
