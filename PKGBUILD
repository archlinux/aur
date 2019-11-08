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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.6.0+7a245bbe-26/u18/zivid-telicam-driver_2.0.0.1-1_amd64.deb)
sha256sums=(1ecaf4a8a47975d82e68a052ab6385f0cf05eb451d2a1c8f06474d258461bd68)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
