# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='1.8.0+89ae8b3e_39'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.8.0+89ae8b3e-39/u18/zivid_1.8.0+89ae8b3e-39_amd64.deb)
sha256sums=(cb86a7f8ddc031f5b3ce5475ec69fecd60cb4a657312194e12f854781a2b10aa)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
