# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Install and Update Proton-GE, rewritten in Rust"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('6448b2c1cb3b846f5c074ba931593b97d9a3c3fe0d329e5daf6170cee99c581f')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
