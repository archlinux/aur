# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.0.0_beta_1+6b13d5ad_356'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.0.0-beta-1+6b13d5ad-356/u18/zivid_2.0.0-beta-1+6b13d5ad-356_amd64.deb)
sha256sums=(830cf0eeb63fc424f707f6b9d1e5bc42eea2df73bbf0dd41b058838515b2c302)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
