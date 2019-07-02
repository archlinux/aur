# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-sdk
pkgver='2.0.0.1_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.4.0+956f554d-12/u18/telicam-sdk_2.0.0.1-1_amd64.deb)
sha256sums=(289ca98cfc935e018572aa85f3566b05576a84867e8d6b20498999d64abe4eca)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
