# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.8.6
pkgrel=2
pkgdesc="CLI program to automate the installation and update of Proton-GE"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('0b8a0cb0c53885f3b1b1f32b3444f1a51a24cd2101eb0265919a2eb578f14c69')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
