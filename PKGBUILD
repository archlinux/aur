# Maintainer: lingdiansr <lingdiansr@example.com>
pkgname=wlsnap-bin
pkgver=v0.1.0
pkgrel=1
pkgdesc="Wayland screenshot utility - CLI-driven capture with editing, Pin, and scrolling support"
arch=('x86_64')
url="https://github.com/lingdiansr/wlsnap"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'libxkbcommon'
)
provides=('wlsnap')
conflicts=('wlsnap')

# Pre-built binary from GitHub Release
source=("$pkgname-$pkgver::https://github.com/lingdiansr/wlsnap/releases/download/$pkgver/wlsnap-$pkgver-x86_64-linux")
sha256sums=('06317134c1c1251440582e906e792ae6714fe50232f789b2523db295436f7ddc')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/wlsnap"
}
