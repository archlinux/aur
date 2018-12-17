# Maintainer: David Bittner <bittneradave@gmail.com>
pkgname='screens'
pkgver=121718
pkgrel=7
pkgdesc="A utility for taking and managing screenshots."
arch=('x86_64')
url="https://www.gitlab.com/DavidBittner/screens"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'libpng' 'libx11' 'curl' 'gstreamermm' 'glibmm')
makedepends=('unzip')
sha512sums=('5005594f5e3939568a9c8b83a9269707a05c7cc630e9f895e4a1ae2a621fb31e3a8f446b125ac42b6b9cff727a2745b282a969de2ea6e4bdf541fd2ccd2a55e2')
provides=('screens')
conflicts=('screens')
source=('https://gitlab.com/davidbittner/Screens/-/jobs/135832236/artifacts/download.zip')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications/"

    install -m 777 screens*.out -T "${pkgdir}/usr/bin/screens"
    install assets/screens.desktop "${pkgdir}/usr/share/applications"
}
