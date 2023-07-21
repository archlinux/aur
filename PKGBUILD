pkgdesc="FLIR GenTL producer interface that enables the user to enumerate, communicate and stream from FLIR GigE Vision and USB3 Vision devices in a generic way independent from the underlying transport technology. This package contains shared libraries."
url='https://www.flir.com/'

pkgname='libgentl'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/libgentl-3.1.0.79.tar.gz")
sha256sums=('2037c88c92d64d1070ea12e77700f0af767bce9895b9305d514d58958758043d')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
