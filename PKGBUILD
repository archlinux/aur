pkgname=amber-bash
pkgver=0.3.1.alpha
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
arch=('x86_64' 'aarch64')
license=('GPL3')
provides=('amber-bash')
confilicts=('amber-bash')

source_x86_64=("https://github.com/Ph0enixKM/Amber/releases/download/0.3.1-alpha/amber_linux_x86_64")
source_aarch64=("https://github.com/Ph0enixKM/Amber/releases/download/0.3.1-alpha/amber_linux_aarch64")

sha256sums_x86_64=('45c58eb59dde765a73f0594f9e246c0808f9b28dcba5f551712bd89d0c05af4c')
sha256sums_aarch64=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
	binfile=$(find . -name "amber_linux_*")
	install -Dm755 "$binfile" "$pkgdir/usr/bin/amber"
}
