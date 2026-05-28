pkgname=tungsay
pkgver=0.1.0
pkgrel=1
pkgdesc="A cowsay CLI but instead of a cow, it's tung tung tung sahur."
arch=('x86_64')
url="https://github.com/Soltrubeg/TungSay"
license=('MIT')
makedepends=('rust' 'cargo')
source=()
sha256sums=()

build() {
    cargo install \
        --root "$srcdir/root" \
        --version "$pkgver" \
        tungsay
}

package() {
    install -Dm755 "$srcdir/root/bin/tungsay" "$pkgdir/usr/bin/tungsay"
}