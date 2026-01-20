# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-systemd
pkgver=1.2.3
pkgrel=1
pkgdesc="A fully colorful customizable TUI display manager made in C. (systemd service files)"
provides=('lidm-service')
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}-systemd::https://raw.githubusercontent.com/javalsai/lidm/v1.2.3/assets/services/systemd.service")
sha256sums=('e63464441a97102194994adc82159871ccd3f23d5e97224f21a460e4296364cc')

package() {
    cd "$srcdir"
    install -Dm0644 "${pkgname}-${pkgver}-systemd" "$pkgdir/usr/lib/systemd/system/lidm.service"
}
