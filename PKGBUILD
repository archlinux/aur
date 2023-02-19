# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=protonup-rs-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Install and Update Proton-GE, rewritten in Rust"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)
sha256sums=('dc9f81517a7156d8398006daa8c9ae9e701809a613ab876a9faeba0774ace08a')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
