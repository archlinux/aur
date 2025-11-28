# Maintainer: Christopher Dolan <siricandobhikkhu@gmail.com>
pkgname=hypr-cycle
giturl="https://github.com/christopherdolan/hypr-cycle.git"
pkgver=0.4.2
pkgrel=1
pkgdesc="A fast and monitor-aware workspace cycler for Hyprland, written in Rust"
provides=(${pkgname}-git)
conflicts=(${pkgname}-git)
arch=('x86_64')
url="${giturl}"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/christopherdolan/hypr-cycle/releases/download/v${pkgver}/hypr-cycle")

sha256sums=('da9c0efd7aa295f13385ede0cbbc29ce4d6f1b256dd224b4fc42538eb66371f4')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/hypr-cycle"
}
