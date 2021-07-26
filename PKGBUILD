# Maintainer: Sidharth Arya <sidhartharya10@gmail.com>
pkgname=pakka
pkgver=0.0.2
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
sha256sums=('39ef5fc5070bcf1abe3ec732131b73c2d2cf8d5c13a9e5e9fffec3a4912c06df')


package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
