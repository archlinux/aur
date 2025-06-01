# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=nyafetch-bin
pkgver=1.6.2
pkgrel=1
pkgdesc='A neofetch alike program that shows hardware and distro information written in rust.'
arch=(x86_64)
url='https://github.com/ico277/nyafetch'
license=('MIT')
depends=(
    'pciutils'
)
conflicts=('nyafetch')
provides=('nyafetch')

source=("nyafetch::https://downloads.iusearchbtw.nl/nyafetch-1.6.2")
sha256sums=('91ee5dcef0cad9030dbb344e7066084e45e8b93df7e9955fdb16aafd7d368658')

package() {
    install -Dm755 nyafetch "${pkgdir}/usr/bin/nyafetch"
}
