# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=protonup-rs-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Install and Update Proton-GE, rewritten in Rust"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)
sha256sums=('5d9719204409b0ec88232f79022f83f39031ceab068984616eb0d9e3c31e267e')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
