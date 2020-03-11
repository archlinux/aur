# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-driver
pkgver='3.0.1.1_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
conflicts=(zivid-telicam-sdk)
provides=(zivid-telicam-sdk)

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.8.1+6967bc1b-1/u18/zivid-telicam-driver_3.0.1.1-1_amd64.deb)
sha256sums=(49d450b9dbbc3700a9468f0f06d29d9f1d3d109bdd2fe7b7fc937f579d8646ec)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
