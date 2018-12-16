# Maintainer: David Bittner <bittneradave@gmail.com>
pkgname='screens'
pkgver=121618
pkgrel=6
pkgdesc="A utility for taking and managing screenshots."
arch=('x86_64')
url="https://www.gitlab.com/DavidBittner/screens"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'libpng' 'libx11' 'curl' 'gstreamermm' 'glibmm')
makedepends=('unzip')
sha512sums=('e6cd7e12890ca0eafb92fa33d7e1252e93e67c6a0d85e7cc17e877bcd55ad77a54ec8a5eeb99d21768c37a48725505dce113d201d52ac23249773b3461922650')
provides=('screens')
conflicts=('screens')
source=('https://gitlab.com/davidbittner/Screens/-/jobs/135169857/artifacts/download.zip')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications/"

    install -m 777 screens*.out -T "${pkgdir}/usr/bin/screens"
    install assets/screens.desktop "${pkgdir}/usr/share/applications"
}
