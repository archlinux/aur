# Maintainer: Claudio Contino <ckonte at outlook dot it>
pkgname=amdvlk-deb
pkgver=2019.Q4.5
pkgrel=1
pkgdesc="AMD Open Source Driver for Vulkan (Stable DEB Release)"
arch=("x86_64")
url="https://github.com/GPUOpen-Drivers/AMDVLK"
license=("MIT")
depends=("vulkan-icd-loader")
conflicts=("amdvlk-git" "amdvlk" "amdvlk-bin")
provides=("amdvlk" "vulkan-driver")
source=(
"https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-${pkgver}/amdvlk_${pkgver}_amd64.deb"
)
sha256sums=('SKIP')

package() {
  tar -xJC "$pkgdir" -f data.tar.xz
}
