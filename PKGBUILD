# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-dinit
pkgver=1.2.3
pkgrel=1
pkgdesc="A fully colorful customizable TUI display manager made in C. (dinit service files)"
provides=('lidm-service')
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}-dinit::https://raw.githubusercontent.com/javalsai/lidm/v1.2.3/assets/services/dinit")
sha256sums=('185cd76c1d29ddc73cf96be999f13278a427bb80aa9169f25f30673ad2de3770')

package() {
    cd "$srcdir"
    install -Dm0644 "${pkgname}-${pkgver}-dinit" "$pkgdir/etc/dinit.d/lidm"
}
