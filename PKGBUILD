# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-driver
pkgver='3.0.1.1_3'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
conflicts=(zivid-telicam-sdk)
provides=(zivid-telicam-sdk)

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.8.1+dd4dffea-1/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(124bbb8166042ca6ab19621ba143641d57f7e52e0393777ff3abdf6210e9c83d)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
