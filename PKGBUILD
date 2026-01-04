# Maintainer: Jonathan Neidel <aur@jneidel.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>

pkgname=yacreader-bin
pkgver="9.16.3"
pkgrel=1
_variant="1.fc42"
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection, binary version."
arch=(x86_64)
url="https://www.yacreader.com/"
license=(GPL3)
depends=(poppler-qt5 libunarr qt5-multimedia qt5-quickcontrols)
conflicts=(yacreader)
provides=(yacreader)
source_x86_64=("https://kojipkgs.fedoraproject.org//packages/yacreader/${pkgver}/${_variant}/x86_64/yacreader-${pkgver}-${_variant}.x86_64.rpm")
sha256sums_x86_64=("b9b523d9a864eb7c1e37e253c5b2d3659b5e62eb40da0237c70528df8c8d0dc4")

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
}
