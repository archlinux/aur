# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.4.0+a330c1a6_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.0+a330c1a6-1/u18/zivid_2.4.0+a330c1a6-1_amd64.deb)
sha256sums=(826f668ba904d68c773b16f29cfb10e3ee510baa0c5c88c043faeb62601b3bc9)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
