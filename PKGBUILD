# Maintainer: Christopher Dolan <siricandobhikkhu@gmail.com>
pkgname=hypr-cycle
giturl="https://github.com/christopherdolan/hypr-cycle.git"
pkgver=0.4.1
pkgrel=1
pkgdesc="A fast and monitor-aware workspace cycler for Hyprland, written in Rust"
provides=(${pkgname}-git)
conflicts=(${pkgname}-git)
arch=('x86_64')
url="${giturl}"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/christopherdolan/hypr-cycle/releases/download/v${pkgver}/hypr-cycle")

sha256sums=('ea2ec7dfcc0abbcac8e7944dee6519d6071b3c61644e89aa7ace53f578e9cb35')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/hypr-cycle"
}
