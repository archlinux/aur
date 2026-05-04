# Maintainer: MedCy1 <mederick.roge@gmail.com>
pkgname=wayinhibit
pkgver=0.2.0
pkgrel=2
pkgdesc="A small Wayland idle inhibitor written in Rust"
arch=('x86_64')
url="https://github.com/MedCy1/wayinhibit"
license=('MIT')
depends=('wayland')
source=(
    "wayinhibit-$pkgver::https://github.com/MedCy1/wayinhibit/releases/download/v$pkgver/wayinhibit-x86_64"
    "LICENSE::https://raw.githubusercontent.com/MedCy1/wayinhibit/v$pkgver/LICENSE"
)
sha256sums=(
    '0638666139be58fa54fc7d8729a4561958a526ddc9447ed4d11229daf25a3ce3'
    'c6f47d3c350962a79fc1501510e8e1cc8fbcc6502d8421505ba1b9fbd1ef6237'
)

package() {
    install -Dm0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
