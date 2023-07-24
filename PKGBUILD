pkgdesc="FLIR GenTL producer interface that enables the user to enumerate, communicate and stream from FLIR GigE Vision and USB3 Vision devices in a generic way independent from the underlying transport technology. This package contains shared libraries."
url='https://www.flir.com/'

pkgname='libspinnaker'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libgentl
    libusb
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/libspinnaker-3.1.0.79.tar.gz")
sha256sums=('19bf58a34960877146e49b1981782893336c4cdc24fb7eba5880b757402d1120')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
