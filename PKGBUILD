# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.9.2
pkgrel=2
pkgdesc="CLI program to automate the installation and update of Proton-GE"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=($pkgname-$pkgver.tar.gz::https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('dc5f5671518ff5956d4ca7cbb49da827df97811e8475ca866a8996db1a16145a')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
