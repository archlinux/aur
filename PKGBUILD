pkgname=amber-bash-bin
pkgver=0.4.0.alpha
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
arch=('x86_64' 'aarch64')
license=('GPL3')
provides=('amber-bash')
conflicts=('amber-bash')

source_x86_64=("https://github.com/amber-lang/amber/releases/download/0.4.0-alpha/amber-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/amber-lang/amber/releases/download/0.4.0-alpha/amber-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('db6604bd4d5f021733a531b70b3e96c6eddc92f58ea8a4a2a84c94cb75a724f2')
sha256sums_aarch64=('8ca9b0d35cb935042e280bf06ba8c2ad30f212dee77fff5d525cc58fcca3e226')

package() {
	dir=$(find . -type d -name "amber-*-unknown-linux-gnu")
	install -Dm755 $dir/amber "$pkgdir/usr/bin/amber"
}

