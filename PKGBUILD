# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
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

source=(https://downloads.zivid.com/sdk/releases/2.11.1+de9b5dae-1/u20/zivid-genicam_2.11.1+de9b5dae-1_amd64.deb)
sha256sums=(2c1227a98f6dc73856c819e0db1e86380984c65ca6401fe96f2b41769d693ffe)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
