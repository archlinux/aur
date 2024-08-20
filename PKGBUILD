# Maintainer: Emilien Devos (unixfox) <contact@emiliendevos.be>
pkgname=pet-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple command-line snippet manager, written in Go."
arch=('x86_64')
url="https://github.com/knqyf263/pet"
license=('MIT')
groups=()
makedepends=()
optdepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=()
backup=()
options=()
source=("pet_"$pkgver"_linux_amd64.tar.gz::https://github.com/knqyf263/pet/releases/download/v$pkgver/pet_"$pkgver"_linux_amd64.tar.gz")
sha256sums=('882d49da6c2c001ef34031bea4facd031e33abdfc43f44c6cf614c406c28d58a')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/pet" "$pkgdir/usr/bin/pet"
}
