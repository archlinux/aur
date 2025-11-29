# Maintainer: Christopher Dolan <siricandobhikkhu@gmail.com>
pkgname=hypr-cycle
giturl="https://github.com/christopherdolan/hypr-cycle.git"
pkgver=0.4.3
pkgrel=1
pkgdesc="A fast and monitor-aware workspace cycler for Hyprland, written in Rust"
provides=(${pkgname}-git)
conflicts=(${pkgname}-git)
arch=('x86_64')
url="${giturl}"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/christopherdolan/hypr-cycle/releases/download/v${pkgver}/hypr-cycle")

sha256sums=('4a2b3625b98e2130b2732fa1b77f70de4f4e9b7b9de380e4c47c0f3bb74ae8a8')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/hypr-cycle"
}
