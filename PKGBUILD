# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.8.6
pkgrel=1
pkgdesc="CLI program to automate the installation and update of Proton-GE"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('b2a7b2287f9c74dabe8cff6cb3bd0026ca76725eac3ab147a6bead0e58ed62a6')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
