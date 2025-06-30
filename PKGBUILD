# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.16.0+46cdaba6_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.16.0+46cdaba6-1/u20/zivid_2.16.0+46cdaba6-1_amd64.deb)
sha256sums=(152d5e0407ff92f1dbb4376466b6151714d2f21463cc14a2b7a1dc8da57849c9)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
