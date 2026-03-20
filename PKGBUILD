# Maintainer: adarshnair <n.adarshnair@outlook.com>

pkgname=tidymyfiles
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool that organizes files into folders based on their extension"
arch=("x86_64")
url="https://github.com/Usernames-are-useful/Tidymyfiles"
license=("MIT")
depends=()
makedepends=("rust" "cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz")
sha256sums=("SKIP")

build() {
    cd "Tidymyfiles-main"
    cargo build --release
}

package() {
    cd "Tidymyfiles-main"
    install -Dm755 "target/release/tidy" "$pkgdir/usr/bin/tidymyfiles"
}
