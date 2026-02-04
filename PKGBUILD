# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Martin Bogdanov <aur@martinbogdanov.com>
# Maintainer: javalsai <javalsai@proton.me>

pkgname=lidm-systemd
pkgver=2.0.0
pkgrel=1
pkgdesc="A fully colorful customizable TUI display manager made in C. (systemd service files)"
provides=('lidm-service')
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}-systemd::https://raw.githubusercontent.com/javalsai/lidm/v2.0.0/assets/services/systemd.service")
sha256sums=('c3ef1dab703a15f5627d38bd31a69fc6b0825b1f04c9b25ed85c8ad250ad5318')

package() {
    cd "$srcdir"
    install -Dm0644 "${pkgname}-${pkgver}-systemd" "$pkgdir/usr/lib/systemd/system/lidm.service"
}
