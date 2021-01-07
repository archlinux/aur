# Maintainer: buzz
pkgname=devilspy
_gitname=devilspy
pkgver=0.1.1
pkgrel=1
pkgdesc="Window matching utility"
arch=("any")
url="https://github.com/buzz/devilspy"
license=("GPL")
depends=("python" "python-gobject" "python-setuptools" "python-click" "python-yaml" "python-xlib")
makedepends=("git")
options=(!emptydirs)
source=("git+https://github.com/buzz/devilspy.git#tag=v${pkgver}")
md5sums=("SKIP")

package() {
    cd "${_gitname}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
