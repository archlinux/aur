# Maintainer: Jonathan Neidel <aur@jneidel.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>

pkgname=yacreader-bin
pkgver="9.16.2"
pkgrel=1
_variant="1.el9"
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection, binary version."
arch=(x86_64)
url="https://www.yacreader.com/"
license=(GPL3)
depends=(poppler-qt5 libunarr qt5-multimedia qt5-quickcontrols)
conflicts=(yacreader)
provides=(yacreader)
source_x86_64=("https://kojipkgs.fedoraproject.org//packages/yacreader/${pkgver}/${_variant}/x86_64/yacreader-${pkgver}-${_variant}.x86_64.rpm")
sha256sums_x86_64=("3eb8db35a2aa6e461b783ea7ba1e99a8dcd43e71f40257d92395e2f4a7dfb09b")

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"
}
