# Maintainer: librewish <librewish@gmail.com>
# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

_gitname=beautyline
pkgname=beautyline
pkgver=20210423
pkgrel=1
pkgdesc="Outlined icons designed to have unified look and comprehensive coverage with the Sweet icon pack (best suited to use with Sweet theme)"
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/artwork/${_gitname}"
license=('unknown')
makedepends=('git')
options=('!strip')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
	install -d ${pkgdir}/usr/share/icons/BeautyLine
    cp -r ${_gitname}/. ${pkgdir}/usr/share/icons/BeautyLine
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
