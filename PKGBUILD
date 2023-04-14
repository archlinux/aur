# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=protonup-rs-bin
pkgver=0.5.0
pkgrel=2
pkgdesc="Install and Update Proton-GE, rewritten in Rust"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)
sha256sums=('9df96ffc9a9926aa9d39b1d3798adcc18116297898521812e2de9668a8639461')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
