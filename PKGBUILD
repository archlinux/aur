# Maintainer: Jojo4GH

pkgname=nav-cli
pkgver="1.2.1"
pkgrel=1
pkgdesc="The interactive and stylish replacement for ls & cd!"
arch=(x86_64 aarch64)
url="https://github.com/Jojo4GH/nav"
license=(MIT)
provides=()
conflicts=()
options=("!strip")
source=(
    "$url/releases/download/v$pkgver/nav-$CARCH-unknown-linux-gnu.tar.gz"
    "$url/releases/download/v$pkgver/nav-$CARCH-unknown-linux-gnu.tar.gz.sha256"
)
sha256sums=("SKIP" "SKIP")

prepare() {
    tar -xvf "nav-$CARCH-unknown-linux-gnu.tar.gz"
}

package() {
    install -Dm755 nav -t "$pkgdir/usr/local/bin/"
}