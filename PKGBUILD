pkgname=amber-bash-bin
pkgver=0.3.4.alpha
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
arch=('x86_64' 'aarch64')
license=('GPL3')
provides=('amber-bash')
conflicts=('amber-bash')

source_x86_64=("https://github.com/amber-lang/amber/releases/download/0.3.4-alpha/amber-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/amber-lang/amber/releases/download/0.3.4-alpha/amber-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('0e0357353beeaebbfdd97142dce1d11459f39b6e07b9e50aacf4998750105a8b')
sha256sums_aarch64=('14a5f75d59adefb8f088fe9c65f4b8f9c07f78f4b4b79d82c210158a43bc75cf')

package() {
	dir=$(find . -type d -name "amber-*-unknown-linux-gnu")
	install -Dm755 $dir/amber "$pkgdir/usr/bin/amber"
}

