# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="CLI program to automate the installation and update of Proton-GE"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=($pkgname-$pkgver.tar.gz::https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('ef8f5e4d8a54545aca6ee8eeb75d012450f593c0494e599204a220fa8df0c4eb')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
