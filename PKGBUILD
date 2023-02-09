# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=protonup-rs-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Install and Update Proton-GE, rewritten in Rust"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.zip)

sha256sums=('b846d89626ebd4166b6d83ed60d9bfb851cbc13e60d5535ac67cfb52985f4ca0')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
