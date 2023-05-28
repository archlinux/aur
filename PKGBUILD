# Maintainer: Jonathan Neidel <aur@jneidel.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>

pkgname=yacreader-bin
pkgver="9.12.0"
pkgrel=2
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection, binary version."
arch=(x86_64)
url="https://www.yacreader.com/"
license=(GPL3)
depends=(poppler-qt5 libunarr qt5-multimedia)
conflicts=(yacreader)
provides=(yacreader)
source_x86_64=("https://download.opensuse.org/repositories/home:/selmf/Debian_Unstable/amd64/yacreader_${pkgver}-1_amd64.deb")
sha256sums_x86_64=("7c0521624986caa19d1164599d47c36085ded17ae5021a85a42cc4aa36f91a3a")

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
