# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi-meet
_pkgname=turnserver
_tag=9153
_version=1.0.9153

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
sha256sums=('56d39f3e166a5fe6216200d7b3e430f6ede57c18b26f1443d67eb1a9ff274a40')
