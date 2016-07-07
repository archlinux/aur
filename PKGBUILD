# Maintainer: Tinxy <arch äŧ tinx ðøŧ eu>

pkgname="updatehint"
pkgver='1.1'
pkgrel=1
arch=('any')
pkgdesc='Provides notifications about Arch Linux updates.'
url="https://aur.archlinux.org/packages/${pkgname}"
license=('GPL3')
depends=('cower'  # Checking for AUR updates
         'zenity' # Displaying desktop notifications
        )
optdepends=('gnome-icon-theme-symbolic: icons in notification boxes'
            'ncurses: console text formatting (tput)')
source=("${pkgname}.sh" )
sha256sums=('cb0575af8f2bc192f632c1bf9e49560bc41090538fec6d2567d29d959f6cc3d2' )

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
