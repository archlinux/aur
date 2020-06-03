# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-driver
pkgver='3.0.1.1_2'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
conflicts=(zivid-telicam-sdk)
provides=(zivid-telicam-sdk)

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.0.0-beta-1+6b13d5ad-356/u18/zivid-telicam-driver_3.0.1.1-2_amd64.deb)
sha256sums=(ab8992b00b31bd2c199ea74bf59d63b23879fa9faca3d54ef86d02243a91b95d)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
