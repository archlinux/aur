# Maintainer: Murat Çileli <murat.cileli@gmail.com>

pkgbase="pkgbase"
pkgname="adwaita-creamy"
pkgver="0.1"
pkgrel="1"
pkgdesc="Refreshed new Adwaita theme with creamy colors and minor changes. "
arch=("x86_64")
license=("MIT")
url="https://github.com/murat-cileli/adwaita-creamy"
makedepends=()
provides=("adwaita-creamy")

source=("git+https://github.com/murat-cileli/adwaita-creamy.git")
sha256sums=("SKIP")

build() {
    cd "${pkgname}"
    mkdir -p ~/.themes/adwaita-creamy
    cp gtk-2.0 ~/.themes/adwaita-creamy/ -R
    cp gtk-3.0 ~/.themes/adwaita-creamy/ -R
    cp index.theme ~/.themes/adwaita-creamy/
}

package() {
  echo "Package"
}

