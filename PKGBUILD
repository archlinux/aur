# Maintainer: Tinxy <arch äŧ tinx ðøŧ eu>

pkgname="updatehint"
pkgver='1.5'
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
sha256sums=('65797a64f2270c9800d8c214c641cb22328429e7bd62c1a079da22675ad8f2fa' )

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
