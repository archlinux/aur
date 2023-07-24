pkgdesc="A library used to communicate with FLIR digital cameras. This package contains shared libraries"
url='https://www.flir.com/'

pkgname='libspinvideo-c'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libspinnaker
    libspinvideo
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/libspinvideo-c-3.1.0.79.tar.gz")
sha256sums=('3b6f1de80bf56ca642ef0a7edf7930dccba6ff6720b2d2f2531eeaae391d2fa4')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
