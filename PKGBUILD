# Maintainer: librewish <librewish@gmail.com>

_gitname=beautyline
pkgname=beautyline
pkgver=20201227
pkgrel=1
pkgdesc="outlined icons Designed to have unified look and comprehensive coverage with Sweet gradient icons. ( best suited to use with Sweet theme)"
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/artwork/${_gitname}"
license=('unknown')
makedepends=('git')
options=('!strip')
provides=("beautyline")
conflicts=("beautyline")
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
	install -d ${pkgdir}/usr/share/icons/BeautyLine
    cp -r ${_gitname}/. ${pkgdir}/usr/share/icons/BeautyLine
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
