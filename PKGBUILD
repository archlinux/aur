# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
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

source=(https://downloads.zivid.com/sdk/releases/2.10.0+8ce7dae3-2/u20/zivid-tools_2.10.0+8ce7dae3-2_amd64.deb)
sha256sums=(7f0e55079715c4ddb5cea308b1376ec92acbdc30ffc734b16875905809946672)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
