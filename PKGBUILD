# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.10.0+8ce7dae3_2'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.10.0+8ce7dae3-2/u20/zivid-genicam_2.10.0+8ce7dae3-2_amd64.deb)
sha256sums=(9ff5fdb368ff20ee6d2bcb5267966485c4eaa7fcea4cad091fec9a7b637a3e5c)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
