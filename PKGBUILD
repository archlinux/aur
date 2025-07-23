# Maintainer: Isabel <isabel@isabelroses.com>
pkgname=catppuccinifier-cli-bin
_pkgname=catppuccinifier
pkgver=9.0.0 # renovate: datasource=github-tags depName=lighttigerXIV/catppuccinifier
pkgrel=1
pkgdesc="An comand line tool to catppuccinifiy your images."
arch=("x86_64")
url="https://github.com/lighttigerXIV/catppuccinifier"
license=()
depends=()
provides=('catppuccinifier')
conflicts=('catppuccinifier')
makedepends=('unzip')
source=("https://github.com/lighttigerXIV/${_pkgname}/releases/download/${pkgver}/Catppuccinifier-Linux-${pkgver}.tar.xz")
md5sums=('dc22be6a6e454df229daa11c8fa42c9b')

build() {
  tar -xf "Catppuccinifier-Linux-${pkgver}.tar.xz"
}

package() {
  install -Dm755 "${srcdir}/Catppuccinifier-Linux-${pkgver}/installation-files/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
