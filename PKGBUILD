# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Amr Hassan <amr.hassan@gmail.com>
pkgname=nakacli-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI Client for Nakadi"
arch=('x86_64')
url="https://github.com/amrhassan/nakacli/"
license=('MIT')
source=("https://github.com/amrhassan/nakacli/releases/download/$pkgver/nakacli-$pkgver-x86_64-unknown-linux-gnu.tar.bz2")

package() {
	install -Dm555 "$srcdir/nakacli" "$pkgdir/usr/bin/nakacli"
}
md5sums=('23ab3d2b1ff623273f81e1eb8a244ede')
