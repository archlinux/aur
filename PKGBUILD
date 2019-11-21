# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-driver
pkgver='2.0.0.1_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
conflicts=(zivid-telicam-sdk)
provides=(zivid-telicam-sdk)

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.7.0+a115eaa4-4/u18/zivid-telicam-driver_2.0.0.1-1_amd64.deb)
sha256sums=(11601ed9d8e77a7bbee21f55044c3fc7a9ba1fbea6df8b5429767aa37e2dae7a)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
