# Maintainer: Alphazo <protonmaildekstop-1902@notracking.email>

pkgname=protonmail-desktop-bin-beta
pkgver=1.0.0
pkgrel=1
_pkgrel=1
pkgdesc="Official native ProtonMail desktop application with calendar support"
arch=('x86_64')
url="https://proton.me/mail/download"
license=('GPL3')
depends=()
optdepends=()
source=("https://proton.me/download/mail/linux/ProtonMail-desktop-beta.deb")
sha256sums=('dc5466d36130f46b8631714093048bf856de2f2688d529a90d4dc0e5e261e935')

prepare() {
    tar xf data.tar.xz
}

package() {
    mv usr/ "${pkgdir}"
}
