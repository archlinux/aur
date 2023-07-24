pkgdesc="A library used to update FLIR digital cameras. This package contains shared libraries."
url='https://www.flir.com/'

pkgname='spinupdate'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libspinnaker
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinupdate-3.1.0.79.tar.gz")
sha256sums=('c975fd9aab097762cdc9e6687e50bf7e5693407872811b481bc5f3894be53ea7')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
