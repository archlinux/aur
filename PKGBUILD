#Maintainer: Antonios Rainakis <antonyrai26@gmail.com>
pkgname=UniBackpack-bin
_pkgname=UniBackpack
pkgver=1.1.0
pkgrel=1
pkgdesc="A Qt6 downloader for software used by greek universities"
arch=('x86_64')
url="https://github.com/open-source-uom/UniBackpack"
license=('GPL3')
depends=('base-devel' 'cmake'  'gcc-libs' 'glibc' 'polkit' 'qt6-base' 'git' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "unibackpack-git")
source=("${url}/releases/download/v${pkgver}/unibackpack_1.0_amd64.deb")
sha256sums=('aa86e04ea6ee6a9f713fbd630611706bf0e24e828175d50feb19527f025ded48')

package() {

	tar -xf data.tar.* -C "${pkgdir}"
	rm -rf "${pkgdir}/DEBIAN"

}
