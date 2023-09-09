# Maintainer: buzz
# Contributor: dude <brrtsm-AT-gmail-DOT-com>
pkgname=twitch-indicator
_gitname=twitch-indicator
pkgver=1.6
pkgrel=1
pkgdesc="Twitch indicator for Linux. Tracks your followed channels and notifies when they go live."
arch=("any")
url="https://github.com/buzz/twitch-indicator"
license=("GPL")
depends=("python" "python-gobject" "desktop-file-utils" "libappindicator-gtk3")
makedepends=("git")
options=(!emptydirs)
source=("git+https://github.com/buzz/twitch-indicator.git#tag=${pkgver}")
md5sums=("SKIP")

package() {
    cd "${_gitname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
