# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi-meet
_pkgname=turnserver
_tag=7658
_version=1.0.7658

pkgname=${_basename}-${_pkgname}-nightly
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Prosody Plugins nightly build"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
optdepends=("coturn")
makedepends=(
        "git"
)
options=('!strip')
backup=(
)
source=(
        "$pkgname::git+https://github.com/jitsi/jitsi-meet#tag=${_tag}"
)

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/debian/jitsi-meet-turn/turnserver.conf doc/debian/jitsi-meet/jitsi-meet.conf
}
sha256sums=('SKIP')
