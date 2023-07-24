pkgdesc="A library used to communicate with FLIR digital cameras. This package contains shared libraries."
url='https://www.flir.com/'

pkgname='spinview-qt-dev'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libspinnaker
    libspinnaker-dev
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinview-qt-dev-3.1.0.79.tar.gz")
sha256sums=('7cee2d0fa4f1fbfd06ae695ea63e24f21a64d4de9dede65d7f0d1132be6182d9')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
