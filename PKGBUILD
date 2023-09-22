# Maintainer: Enzo Einhorn <enzo.einh@gmail.com>

pkgname=gnome-extensions-cli
_pkgname=gnome_extensions_cli
pkgver=0.9.5
pkgrel=1
pkgdesc="Install, update and manage your Gnome Shell extensions from your terminal !"
arch=("any")
url="https://github.com/essembeh/${pkgname}"
license=("Apache")
makedepends=(python-installer)
optdepends=("dbus: recommended, handle extensions with DBus")
source=("https://pypi.io/packages/py3/g/${_pkgname}/${_pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=("4f949879318af25862fdfafb79d2e5c6dc55fc0e94a24043ffbcf4adbe4961d2")

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" *.whl
}