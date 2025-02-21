# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.14.2+1a322f18_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.2+1a322f18-1/u20/zivid_2.14.2+1a322f18-1_amd64.deb)
sha256sums=(1e75e554ad23e00c02af2c29b9fa49870dc846e75cff6fcd6e6c150d6a59b8e6)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
