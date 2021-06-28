# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-infi
pkgver=2019.01.05
pkgrel=4
pkgdesc="Create empty infi namespace for packages by Infinidat"
arch=("any")
license=("BSD3")
depends=("python-setuptools")
source=("__init__.py")
sha256sums=("ab724d9879f408c3ed12a90c478d25923290cee594b53dfdc48154609f8c2881")

package() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0], end='')")
    install -Dm644 __init__.py "${pkgdir}${_site_packages}/infi/__init__.py"
}
