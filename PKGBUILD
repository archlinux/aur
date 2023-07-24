pkgdesc="Binaries and examples. This package contains examples using the Spinnaker SDK."
url='https://www.flir.com/'

pkgname='spinnaker'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libspinnaker
    libspinnaker-c
    libspinvideo
    libspinvideo-c
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinnaker-3.1.0.79.tar.gz")
sha256sums=('6f15b3c5871cb7d5eb1513b6a9faa6a1be1865d536bcfe2983b382fb21783b29')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
