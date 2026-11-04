# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="CLI program to automate the installation and update of Proton-GE"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=($pkgname-$pkgver.tar.gz::https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('55d8d36f6aceaa998c082fd1d3ff01b7237612d09017f71de28871b425c9570f')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
