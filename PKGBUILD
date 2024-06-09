# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="CLI program to automate the installation and update of Proton-GE"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=(https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('e39787e3e7fb88454c7e6871e4c81774eda554a8785e84426bace9b62b57b78c')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
