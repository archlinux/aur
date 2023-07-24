pkgdesc="This package contains an image capture application used to communicate with FLIR digital cameras. This package contains shared libraries."
url='https://www.flir.com/'

pkgname='spinview-qt'
pkgver='3.1.0.79'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    cuda-tools
    hicolor-icon-theme
    intel-oneapi-basekit
    libspinnaker
    libspinvideo
    qt5-base
    qt5-tools
    ffmpeg
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinview-qt-3.1.0.79.tar.gz")
sha256sums=('82ef2cb68928475f0f6b051a1efda5699975e1a3c617e71ef05fe62a15c3476f')

package() {
    # Extract data
    tar -xzf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/
}
