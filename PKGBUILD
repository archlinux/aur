pkgdesc="A library used to communicate with FLIR digital cameras. This package contains shared libraries"
url='https://www.flir.com/'

pkgname='libspinvideo-dev'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libspinnaker
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/libspinvideo-dev-3.1.0.79.tar.gz")
sha256sums=('12efbbfb05d7aefa74f2e2d13ee35a8cde1614705f7ac38564280886c6532dc8')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
