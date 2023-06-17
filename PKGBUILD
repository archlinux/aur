# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Install and Update Proton-GE, rewritten in Rust"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('c81392ece188ba765f9c2f06cd6648e43546ad2a6b0f62615f7b7c0e421d3841')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
