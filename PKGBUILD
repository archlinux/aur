# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname=lidm-systemd
pkgname=${_pkgname}-git
pkgver=1.2.3
pkgrel=1
pkgdesc="A fully colorful customizable TUI display manager made in C. (systemd service files - git vcs)"
provides=('lidm-service')
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}-systemd::https://raw.githubusercontent.com/javalsai/lidm/refs/heads/master/assets/services/systemd.service")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"
    install -Dm0644 "${pkgname}-${pkgver}-systemd" "$pkgdir/usr/lib/systemd/system/lidm.service"
}
