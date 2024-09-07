pkgname=amber-bash-bin
pkgver=0.3.5.alpha
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
arch=('x86_64' 'aarch64')
license=('GPL3')
provides=('amber-bash')
conflicts=('amber-bash')

source_x86_64=("https://github.com/amber-lang/amber/releases/download/0.3.5-alpha/amber-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/amber-lang/amber/releases/download/0.3.5-alpha/amber-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('46fc6e98bd1a036cc40360724a2f2f17f2fef794aedac35fd885cd2c346460a4')
sha256sums_aarch64=('46fc6e98bd1a036cc40360724a2f2f17f2fef794aedac35fd885cd2c346460a4')

package() {
	dir=$(find . -type d -name "amber-*-unknown-linux-gnu")
	install -Dm755 $dir/amber "$pkgdir/usr/bin/amber"
}

