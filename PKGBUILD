# Maintainer: Pierre Ayoub (Drack) <pierre.ayoub@protonmail.com>
# Contributor: Ivan Abdulin <ivan_abdulin@fastmail.com>
# Contributor: Emilien Devos (unixfox) <contact@emiliendevos.be>
pkgname=pet-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple command-line snippet manager, written in Go."
arch=('x86_64')
url="https://github.com/knqyf263/pet"
license=('MIT')
groups=()
makedepends=()
optdepends=('fzf: supported selector'
            'peco: supported selector')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=()
backup=()
options=()
source=("pet_"$pkgver"_linux_amd64.tar.gz::https://github.com/knqyf263/pet/releases/download/v"$pkgver"/pet_"$pkgver"_linux_amd64.tar.gz")
sha256sums=('be6ca6b64953f3c63430b1519382bdf56a062a03944b9a3723513b285c91dd20')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/pet" "$pkgdir/usr/bin/pet"
}
