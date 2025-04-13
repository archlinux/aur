# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="CLI program to automate the installation and update of Proton-GE"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('e3ea15a88400c88d7cdac964a0421c3b8cac35114dfd6b06d96adf3e0484213a')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
