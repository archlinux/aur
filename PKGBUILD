# Maintainer: Tinxy <arch äŧ tinx ðøŧ eu>

pkgname="updatehint"
pkgver='1.0'
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
sha256sums=('eca9a95e0fd41ce4a5a1c852eef238e6eeb484434495625ce05c7810615f25ee' )

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
