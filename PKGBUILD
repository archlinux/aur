pkgdesc="A library used to communicate with FLIR digital cameras. This package contains shared libraries"
url='https://www.flir.com/'

pkgname='libspinnaker-c-dev'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libspinnaker
    libspinnaker-c
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/libspinnaker-c-dev-3.1.0.79.tar.gz")
sha256sums=('e976a877916afba4ac32ee91489cfde9d9d699cdd0888066816ff3b932d3be57')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
