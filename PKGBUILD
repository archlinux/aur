# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-driver
pkgver='3.0.1.1_3'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
conflicts=(zivid-telicam-sdk)
provides=(zivid-telicam-sdk)

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.10.0+8ce7dae3-2/u20/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(18eb7ce024f9ac0a2ca99d07e17adaad8c1837c9ca0ee7f6175637cd432bb26a)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
