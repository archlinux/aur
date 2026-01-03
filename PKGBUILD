# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.9.3
pkgrel=2
pkgdesc="CLI program to automate the installation and update of Proton-GE"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=($pkgname-$pkgver.tar.gz::https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('a674aaad1112aea2571237b56119ccdbc85967741e38c038b25527273a82055b')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
