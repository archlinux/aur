# Maintainer: Florian Aust <aust.flo@gmail.com>
# based on "/usr/share/psd/browsers/firefox"

pkgname=profile-sync-daemon-librewolf
pkgver=2022.11.29
pkgrel=1
pkgdesc="LibreWolf browser support for profile-sync-daemon"
arch=('any')
license=('GPL')
depends=('profile-sync-daemon')
optdepends=('librewolf' 'librewolf-bin')
install="${pkgname}.install"
source=('librewolf' "${pkgname}.install")
md5sums=('9237301669a29575f0aab801d5936728' 'caa8d8e321b7e38785e48552e004cd1f')

package() {
    install -Dm644 librewolf "${pkgdir}/usr/share/psd/browsers/librewolf"
}

