# Maintainer: Tinxy <arch äŧ tinx ðøŧ eu>

pkgname="updatehint"
pkgver='1.4'
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
sha256sums=('b1bf5955ca998d111124b8b9167066c67bdc7f67a356414ab2d52b41684d66cc' )

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
