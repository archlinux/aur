# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.5.0+19fa6891_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.5.0+19fa6891-1/u18/zivid-tools_2.5.0+19fa6891-1_amd64.deb)
sha256sums=(797755d15348888ce5fd796e5c21d3e3735d52fedb420d84c9522574c560e986)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
