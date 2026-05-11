# Maintainer: ctech12 <https://aur.archlinux.org/account/ctech12>
pkgname=arfetch-bin
pkgver=0.0.2a
pkgrel=1
pkgdesc="Fetch script written in Python specifically for Artix Linux"
arch=('x86_64')
url="https://github.com/ColinZeDev/arfetch"
license=('MIT')
source=("arfetch-${pkgver}::https://github.com/ColinZeDev/arfetch/releases/download/002a/arfetch")
depends=('ttf-nerd-fonts-symbols')
sha256sums=('cd2387209aaa9347156749c2ff64109de1e3e8e276a0f196e6625f2583b1e532')

package() {
    install -Dm755 "${srcdir}/arfetch-${pkgver}" "${pkgdir}/usr/bin/arfetch"
}
