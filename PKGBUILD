pkgname=amber-bash-bin
pkgver=0.3.2.alpha
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
arch=('x86_64' 'aarch64')
license=('GPL3')
provides=('amber-bash')
conflicts=('amber-bash')

source_x86_64=("https://github.com/Ph0enixKM/Amber/releases/download/0.3.2-alpha/amber-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/Ph0enixKM/Amber/releases/download/0.3.2-alpha/amber-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('0529eb540a8f4d994173e96307b3255ce631b8307fc858be4637f9f098a2ee98')
sha256sums_aarch64=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
	dir=$(find . -type d -name "amber-*-unknown-linux-gnu")
	install -Dm755 $dir/amber "$pkgdir/usr/bin/amber"
}

