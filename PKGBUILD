# Maintainer: ctech12 <https://aur.archlinux.org/account/ctech12>
pkgname=arfetch-bin
pkgver=0.0.3a
pkgrel=1
pkgdesc="Fetch script written in Python specifically for Artix Linux"
arch=('x86_64')
url="https://github.com/ColinZeDev/arfetch"
license=('MIT')
source=("arfetch-${pkgver}::https://github.com/ColinZeDev/arfetch/releases/download/003a/arfetch")
depends=('ttf-nerd-fonts-symbols')
sha256sums=('15d740aeae44bbef90e755d3c46a91ab54385f245ad5d253b995bb7223b42cba')

package() {
    install -Dm755 "${srcdir}/arfetch-${pkgver}" "${pkgdir}/usr/bin/arfetch"
}
