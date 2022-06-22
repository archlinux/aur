# Maintainer: Arthurdw <contact@arthurdw.com>
pkgname=python-statusof
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="Small python script to check the status of a list of urls."
arch=(x86_64 i686)
url="https://github.com/Arthurdw/statusof"
license=('MIT')
groups=()
depends=(python)
makedepends=(python-pip)
checkdepends=()
optdepends=()
provides=(statusof)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

package() {
    python3 -m pip install -U statusof==$pkgver
    echo "Statusof has been installed through pip."
    echo "To uninstall it use: pip uninstall statusof"
}
