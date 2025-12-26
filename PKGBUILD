# Maintainer: PharmaRacist
pkgname=noon-nvidia-legacy
pkgver=1.0.0
pkgrel=1
pkgdesc="Legacy NVIDIA drivers support for Noon (580xx drivers)"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
    'nvidia-580xx-dkms'
    'nvidia-580xx-utils'
    'opencl-nvidia-580xx'
    'lib32-nvidia-580xx-utils'
    'lib32-opencl-nvidia'
    'libva-nvidia-driver'
    'egl-wayland'
)
conflicts=('noon-nvidia')
provides=('noon-nvidia-legacy-support')
install=noon-nvidia-legacy.install
source=("setup_nvidia.sh::https://raw.githubusercontent.com/PharmaRacist/Noon/main/setup_data/setup_nvidia.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 setup_nvidia.sh "$pkgdir/usr/bin/noon-nvidia-legacy-setup"
}
