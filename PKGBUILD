# Maintainer: Adrià Cereto i Massagué <ssorgatem at gmail.com>

pkgbase=dxvk-wine-git
pkgname=('dxvk-winelib-git')
pkgver=1.6.1.r1.g436357e2
pkgrel=1
pkgdesc="No longer supported upstream. Please use the dxvk-mingw-git package instead"
arch=('x86_64')
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
depends=("dxvk-mingw-git")
provides=("dxvk" "d9vk" "dxvk=$pkgver")
makedepends=("dxvk-mingw-git")

build() {
    echo "DXVK no longer supports winelib builds. This package is now empty as a temporary transition package to the MinGW one"
    echo "IMPORTANT: you will need to re-run the setup_dxvk.sh script for each of your wineprefixes after switching to a non-winelib build!"
}

package_dxvk-winelib-git() {
  echo
}
