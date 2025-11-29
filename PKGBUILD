# Maintainer: Christopher Dolan <siricandobhikkhu@gmail.com>
pkgname=hypr-cycle
giturl="https://github.com/christopherdolan/hypr-cycle.git"
pkgver=0.5.0
pkgrel=1
pkgdesc="A fast and monitor-aware workspace cycler for Hyprland, written in Rust"
provides=(${pkgname}-git)
conflicts=(${pkgname}-git)
arch=('x86_64')
url="${giturl}"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/christopherdolan/hypr-cycle/releases/download/v${pkgver}/hypr-cycle")

sha256sums=('4771e78f3eb46620bb76aef24ccd29ecc292b9f89b5f8bbe5117bde378eb8350')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/hypr-cycle"
}
