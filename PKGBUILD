# Maintainer: David Bittner <bittneradave@gmail.com>
pkgname='screens'
pkgver=200818
pkgrel=3
pkgdesc="A utility for taking and managing screenshots."
arch=('x86_64')
url="https://www.gitlab.com/DavidBittner/screens"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'libpng' 'libx11' 'curl' 'gstreamermm' 'glibmm')
makedepends=('unzip')
sha512sums=('0e808b4420894d7d852ad11441d59111968ac9c0822ba6d38c8e8a34c88f5d12f40a037a2f6167618c48d96d8db3a4038163fbdd52d820b54e61d452bd214dad')
provides=('screens')
conflicts=('screens')
source=('https://gitlab.com/davidbittner/Screens/-/jobs/83263641/artifacts/download.zip')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications/"

    install -m 777 screens*.out -T "${pkgdir}/usr/bin/screens"
    install assets/screens.desktop "${pkgdir}/usr/share/applications"
}
