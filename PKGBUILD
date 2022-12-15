# Maintainer: buzz <buzz-AT-l4m1-DOT-de>
pkgname=volctl
_gitname=volctl
pkgver=0.9.3
pkgrel=1
pkgdesc="Per-application volume control and OSD for Linux desktops."
arch=("any")
url="https://buzz.github.io/volctl/"
license=("GPL")
depends=("python" "python-gobject" "python-setuptools" "python-cairo" "pulseaudio" "desktop-file-utils" "python-pulsectl")
optdepends=("pavucontrol: mixer support", "statusnotifier-introspection-dbus-menu: SNI support")
makedepends=("git")
options=(!emptydirs)
source=("git+https://github.com/buzz/volctl.git#tag=v${pkgver}")
md5sums=("SKIP")

package() {
    cd "${_gitname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
