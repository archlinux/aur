# Maintainer: erk <valdemarerk at gmail dot com>
pkgname=ttf-ibm-plex-git
pkgver=0.5.3
pkgrel=1
pkgdesc="IBM Plex"
arch=('any')
url='https://ibm.github.io/type/'
license=('SIL Open Font License, Version 1.1')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')

source=("git://github.com/IBM/type.git")
sha256sums=(SKIP)

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/type/fonts/Mono/desktop/pc/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/type/fonts/Sans/desktop/pc/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/type/fonts/Serif/desktop/pc/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/type/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}
}
