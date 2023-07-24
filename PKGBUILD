pkgdesc="A library used to communicate with FLIR digital cameras. This package contains shared libraries"
url='https://www.flir.com/'

pkgname='libspinnaker-dev'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libspinnaker
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/libspinnaker-dev-3.1.0.79.tar.gz")
sha256sums=('88d173d4af3a8d89710bcfacae4771d7ffc4504a98dd02f8f2362edefa53b7bc')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
