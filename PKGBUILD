# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=protonup-rs-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="CLI program to automate the installation and update of Proton-GE"
url="https://github.com/auyer/Protonup-rs"
license=("Apache")
arch=('any')
provides=('protonup-rs')
conflicts=('protonup-rs')
source=($pkgname-$pkgver.tar.gz::https://github.com/auyer/Protonup-rs/releases/download/v$pkgver/protonup-rs-linux-amd64.tar.gz)

sha256sums=('652d891a05b6fe5f0ed534409f7ab302f3037cb7b323a0ee0f0bf7d253e9f23c')

package() {
	install -D protonup-rs	"$pkgdir"/usr/bin/protonup-rs
}
