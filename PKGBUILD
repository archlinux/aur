# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.11.1+de9b5dae_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.11.1+de9b5dae-1/u20/zivid_2.11.1+de9b5dae-1_amd64.deb)
sha256sums=(750655a0a1cd96869e2d8a8b072ae1c050461c8bdf3d539dfb62bcc3770ff5c8)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
