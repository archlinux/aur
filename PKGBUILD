# Maintainer: ctech12 <https://aur.archlinux.org/account/ctech12>
pkgname=arfetch-bin
pkgver=0.0.1a
pkgrel=1
pkgdesc="Fetch script written in Python specifically for Artix Linux"
arch=('x86_64')
url="https://github.com/ColinZeDev/arfetch"
license=('MIT')
source=("arfetch-${pkgver}::https://github.com/ColinZeDev/arfetch/releases/download/001a/arfetch")
depends=()
sha256sums=('f799d5c9de7535bdf047a9d4c469445eb991c295b21019f6758b297d19077418')

package() {
    install -Dm755 "${srcdir}/arfetch-${pkgver}" "${pkgdir}/usr/bin/arfetch"
}