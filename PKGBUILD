# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Install and Update Proton-GE, rewritten in Rust"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('e480679be0f9b016baaf6ef005c67b0a35e16a090168167ee8677c8b8f8f432b')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
