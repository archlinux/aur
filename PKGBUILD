pkgdesc="Documentation for spinnaker libraries. This package contains the documentation."
url='https://www.flir.com/'

pkgname='spinnaker-doc'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    spinnaker
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinnaker-doc-3.1.0.79.tar.gz")
sha256sums=('dcb3807872e380027d88c30e60359291504a2f0d7a2a36d0a58760caa9f23414')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
