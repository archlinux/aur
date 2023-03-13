# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=protonup-rs-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Install and Update Proton-GE, rewritten in Rust"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)
sha256sums=('ee533dc735c1c25380ad811b13f20933c2ad009d376150604b4ae5facc9bb090')


package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
