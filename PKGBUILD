# Maintainer: Arthurdw <contact@arthurdw.com>
pkgname=python-statusof
pkgver=0.2.2
pkgrel=1
pkgdesc="Small python script to check the status of a list of urls."
arch=(x86_64 i686)
url="https://github.com/Arthurdw/statusof"
license=('MIT')
depends=(python)
makedepends=(python-pip)
provides=(statusof)

package() {
    python3 -m pip install -U statusof==$pkgver
    echo "Statusof has been installed through pip."
    echo "To uninstall it use: pip uninstall statusof"
}
