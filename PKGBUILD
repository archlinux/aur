# Maintainer: buzz <buzz-AT-l4m1-DOT-de>
pkgname=volctl
_gitname=volctl
pkgver=0.6.3
pkgrel=1
pkgdesc="Per-application volume control for GNU/Linux desktops"
arch=("any")
url="https://buzz.github.io/volctl/"
license=("GPL")
depends=("python" "python-gobject" "python-setuptools" "pulseaudio" "desktop-file-utils")
optdepends=("pavucontrol: mixer support")
makedepends=("git")
options=(!emptydirs)
source=("git+https://github.com/buzz/volctl.git#tag=${pkgver}")
md5sums=("SKIP")

package() {
    cd "${_gitname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
