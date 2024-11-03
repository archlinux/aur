# Maintainer: Jonathan Neidel <aur@jneidel.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pedro A. Lopez-Valencia <https://aur.archlinux.org/user/vorbote/>
# Contributor: weearc <q19981121@163.com>
# Contributor: <ar@nullsum.net>

pkgname=yacreader-bin
pkgver="9.14.2"
pkgrel=5
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection, binary version."
arch=(x86_64)
url="https://www.yacreader.com/"
license=(GPL3)
depends=(poppler-qt5 libunarr qt5-multimedia)
conflicts=(yacreader)
provides=(yacreader)
source_x86_64=("https://download.opensuse.org/repositories/home:/selmf/Debian_Unstable/amd64/yacreader_${pkgver}-1_amd64.deb")
sha256sums_x86_64=("8679f95d9056508e29549a197783a53cb69b77a54062ed0e135a022beb9e1c02")

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
