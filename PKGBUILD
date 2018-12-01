# Maintainer: David Bittner <bittneradave@gmail.com>
pkgname='screens'
pkgver=120118_2
pkgrel=5
pkgdesc="A utility for taking and managing screenshots."
arch=('x86_64')
url="https://www.gitlab.com/DavidBittner/screens"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'libpng' 'libx11' 'curl' 'gstreamermm' 'glibmm')
makedepends=('unzip')
sha512sums=('2a6d9907dc6a52a31633504e5a8ba90ae17adc59f5c571b273a2de686d82c6c5411c988a12bdf6ba8b6f67c78f278cecdc80564c37eb8f896cacb067e3387d95')
provides=('screens')
conflicts=('screens')
source=('https://gitlab.com/davidbittner/Screens/-/jobs/128318642/artifacts/download')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications/"

    install -m 777 screens*.out -T "${pkgdir}/usr/bin/screens"
    install assets/screens.desktop "${pkgdir}/usr/share/applications"
}
