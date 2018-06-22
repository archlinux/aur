# Maintainer: Emilien Devos (unixfox) <contact@emiliendevos.be>
pkgname=pet-bin
pkgver=0.3.2
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
md5sums=('b409bc17b21762b740c28e9cae6c34fd')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/pet" "$pkgdir/usr/bin/pet"
}
