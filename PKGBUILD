# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.4.2+1a2e8cfb_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.2+1a2e8cfb-1/u18/zivid-studio_2.4.2+1a2e8cfb-1_amd64.deb)
sha256sums=(3fe7ca3f6e450d158d053aa5fc06852edbe188437efb07e2526e66823d4f1e2b)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
