pkgname=yup-bin
_pkgname=yup
pkgver="1.1.1"
_pkgver="1.1.1"
pkgrel=1
pkgdesc="Arch Linux AUR Helper with ncurses functionality and better searching and sorting"
arch=('x86_64')
url="https://github.com/ericm/yup"
license=('GPL3')
source=("https://github.com/ericm/yup/releases/download/v${_pkgver}/yup")
sha256sums=('SKIP')
conflicts=('yup')

depends=('pacman>=5.1' 'git' 'ncurses' 'sudo')

package() {
    install -Dm755 yup ${pkgdir}/usr/local/bin/yup
}
