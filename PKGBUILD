# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.2.0+f0867d62_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.2.0+f0867d62-1/u18/zivid-studio_2.2.0+f0867d62-1_amd64.deb)
sha256sums=(9a55ca2c484bace877e08ea5ac6348858bfd9f2440274a366631b364fc76000a)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
