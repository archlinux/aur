# Maintainer: Christopher Dolan <siricandobhikkhu@gmail.com>
pkgname=hypr-cycle
giturl="https://github.com/christopherdolan/hypr-cycle.git"
pkgver=0.4.0
pkgrel=2
pkgdesc="A fast and monitor-aware workspace cycler for Hyprland, written in Rust"
provides=(${pkgname}-git)
conflicts=(${pkgname}-git)
arch=('x86_64')
url="${giturl}"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/christopherdolan/hypr-cycle/releases/download/v${pkgver}/hypr-cycle")

sha256sums=('a68f5758b74b2982978ac86b8812c6b08a871ad3cc19bfa578c7a2aef920e81a')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/hypr-cycle"
}
