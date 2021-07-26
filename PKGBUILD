# Maintainer: Sidharth Arya <sidhartharya10@gmail.com>
pkgname=pakka
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple bash based AUR helper for Arch Linux"
arch=(x86_64)
url="https://github.com/SidharthArya/pakka"
license=('GPL2')
groups=()
depends=("bash" "curl" "git" "jq")
makedepends=()
optdepends=()
keywords=("AUR" "helper" "pacman" "bash" "wrapper")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/SidharthArya/$pkgname/archive/refs/tags/$pkgver.tar.gz)
noextract=()
sha256sums=('36079d943a0e8cc8614a400c18881df3320ea3e3680651c28c932e8b5dacb6e0')


package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
