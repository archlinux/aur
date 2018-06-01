# Maintainer: Tinxy <arch äŧ tinx ðøŧ eu>

pkgname="updatehint"
pkgver='1.6'
pkgrel=2
arch=('any')
pkgdesc='Provides notifications about Arch Linux updates.'
url="https://aur.archlinux.org/packages/${pkgname}"
license=('GPL3')
depends=('auracle'        # Checking for AUR updates
         'pacman-contrib' # Checking for Arch updates
         'zenity')        # Displaying desktop notifications
optdepends=('gnome-icon-theme-symbolic: icons in notification boxes'
            'ncurses: console text formatting (tput)')
source=("${pkgname}.sh")
sha256sums=('d92b283d07f1138af8089ab9a823656a60eb5819b179f1271d29b108e8af37e9' )

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
