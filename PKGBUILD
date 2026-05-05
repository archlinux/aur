# Maintainer: MedCy1 <mederick.roge@gmail.com>
pkgname=wayinhibit
pkgver=0.4.0
pkgrel=1
pkgdesc="A small Wayland idle inhibitor written in Rust"
arch=('x86_64')
url="https://github.com/MedCy1/wayinhibit"
license=('MIT')
depends=('wayland')
source=(
    "wayinhibit-$pkgver::https://github.com/MedCy1/wayinhibit/releases/download/v$pkgver/wayinhibit-$CARCH"
    "LICENSE::https://raw.githubusercontent.com/MedCy1/wayinhibit/v$pkgver/LICENSE"
)
sha256sums=(
    'a97e513d09ca23a9c740df15384d661bc41283f932b4ce14e1efc3b26089c8f1'
    'c6f47d3c350962a79fc1501510e8e1cc8fbcc6502d8421505ba1b9fbd1ef6237'
)

package() {
    install -Dm0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
