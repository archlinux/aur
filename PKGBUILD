# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.0.0_beta_1+6b13d5ad_356'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.0.0-beta-1+6b13d5ad-356/u18/zivid-tools_2.0.0-beta-1+6b13d5ad-356_amd64.deb)
sha256sums=(2cb6dd20c65e317376aeb852771c80f16b7ce65dba22497845531a3e5c949ec9)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
