# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=protonup-rs-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Install and Update Proton-GE, rewritten in Rust"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)
sha256sums=('71d7fbec6e1e1c91311ca080c4102dfc0ea3e3d2640f38587d7a07ff173d9875')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
