# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-infi
pkgver=2019.01.05
pkgrel=3
pkgdesc="Create empty infi namespace for packages by Infinidat"
arch=("any")
license=("BSD3")
depends=("python-setuptools")
source=("__init__.py")
sha256sums=("1be778dfcbcfc7b9bf92ce5ef574ed337bbb2c344ee5d492ba489bba45a6c8f3")

package() {
    _sitepkgs_dir="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib(), end='')")"
    install -Dm644 __init__.py "${pkgdir}${_sitepkgs_dir}/infi/__init__.py"
}
