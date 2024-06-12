pkgname=amber-bash-bin
pkgver=0.3.1.alpha
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
arch=('x86_64' 'aarch64')
license=('GPL3')
provides=('amber-bash')
conflicts=('amber-bash')

source_x86_64=("https://github.com/Ph0enixKM/Amber/releases/download/0.3.1-alpha/amber_linux_x86_64")
source_aarch64=("https://github.com/Ph0enixKM/Amber/releases/download/0.3.1-alpha/amber_linux_aarch64")

sha256sums_x86_64=('19677119811c864dd3092f48b9149612cf1dbd77e4172ff4e52b92ca3625c952')
sha256sums_aarch64=('73870093f74a413205a5967242fddbf6c692f1ab868fec9a24157680ec41d988')

package() {
	binfile=$(find . -name "amber_linux_*")
	install -Dm755 "$binfile" "$pkgdir/usr/bin/amber"
}
