# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kdeartwork-colorschemes-menda
pkgver=20150326
pkgrel=1
pkgdesc="Menda color schemes for KDE4"
arch=('any')
url="https://aur.archlinux.org/packages/kdeartwork-colorschemes-menda/"
license=('GPL3')
depends=('kdebase-workspace')
optdepends=('menda-circle-icon-theme: Recommended icon theme'
            'menda-square-icon-theme: Recommended icon theme'
            'faenza-green-icon-theme: Recommended icon theme')
source=('menda.colors' 'menda-dark.colors')
sha256sums=('384bc83804a5b96dbec94c1af4e1622d6def2e7438f2b0168c3d1f094cbdfa0b'
            '95506da0a42d4a823c8b89fc4581b89298306b7a81dc09898dc132c278e7bd6b')

package() {
    install -Dm644 ${srcdir}/menda.colors ${pkgdir}/usr/share/apps/color-schemes/menda.colors
    install -Dm644 ${srcdir}/menda-dark.colors ${pkgdir}/usr/share/apps/color-schemes/menda-dark.colors
}
