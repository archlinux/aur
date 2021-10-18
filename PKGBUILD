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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.5.0+19fa6891-1/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(9ca023147305d013941cf213af307f6e2592874c74230e8e67ac70e261c86896)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
