# Maintainer: erk <valdemarerk at gmail dot com>
pkgname=ttf-ibm-plex-git
pkgver=1.0.1
pkgrel=1
pkgdesc="IBM Plex"
arch=('any')
url='https://ibm.github.io/type/'
license=('SIL Open Font License, Version 1.1')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')

source=("git://github.com/IBM/plex.git")
sha256sums=(SKIP)

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/plex/IBM-Plex-Mono/fonts/complete/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/plex/IBM-Plex-Sans-Condensed/fonts/complete/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/plex/IBM-Plex-Sans/fonts/complete/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/plex/IBM-Plex-Serif/fonts/complete/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/plex/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
