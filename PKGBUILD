# Maintainer: David Bittner <bittneradave@gmail.com>
pkgname='screens'
pkgver=200818
pkgrel=2
pkgdesc="A utility for taking and managing screenshots."
arch=('x86_64')
url="https://www.gitlab.com/DavidBittner/screens"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'libpng' 'libx11' 'curl' 'gstreamermm' 'glibmm')
makedepends=('unzip')
sha512sums=('06025cdc54b4ed364ef700657370fbf940b7de3c8e5f1852d38d5ed1e89646c2234a53a81cc244ac5335e7ee595bba1bf89a303ea1071d9a4675c9ea8db1b171')
provides=('screens')
conflicts=('screens')
source=('https://gitlab.com/davidbittner/Screens/-/jobs/83118491/artifacts/download.zip')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications/"

    install -m 777 screens*.out -T "${pkgdir}/usr/bin/screens"
    install assets/screens.desktop "${pkgdir}/usr/share/applications"
}
