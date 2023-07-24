pkgdesc="A library used to update FLIR digital cameras. This package contains shared libraries."
url='https://www.flir.com/'

pkgname='spinupdate-dev'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libspinnaker
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinupdate-dev-3.1.0.79.tar.gz")
sha256sums=('fa2109c273c1455a831e0036b47f71ca8e2fdc1da024cb45b739544d1156063b')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
