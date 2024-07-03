# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.13.0+99a4ce9e_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.13.0+99a4ce9e-1/u20/zivid-genicam_2.13.0+99a4ce9e-1_amd64.deb)
sha256sums=(1e157b4c6f64778a3c70c5129e846843fcff1a1346147fce81995fe8f400f226)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
