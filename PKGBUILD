# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.11.1+de9b5dae_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.11.1+de9b5dae-1/u20/zivid-tools_2.11.1+de9b5dae-1_amd64.deb)
sha256sums=(023e3eccb54d2c191fe0e2fb07e2d7f4d3e83c00f53db3d00d8627f64b626617)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
