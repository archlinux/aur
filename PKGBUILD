# Maintainer: Pranav Laxman <plaxman81 at gmail dot com>

pkgname='local-chaos'
pkgver=0.1.0
pkgrel=1
pkgdesc=''
url='https://codeberg.org/plax/local-chaos'
license=('GPL-3.0-or-later')
source=("git+${url}")
sha256sums=('SKIP')
arch=('any')
depends=(bash coreutils pacman pacutils)

package() {
    cd "${pkgname}"
    install -Dm 755 local-chaos "${pkgdir}/usr/bin/local-chaos"
}
