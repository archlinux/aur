# Mantainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

pkgname=nvidia-cuda-gdk
pkgver=352.39
pkgrel=1
pkgdesc="Nvidia GPU Deployment Kit"
arch=('x86_64')
url="https://developer.nvidia.com/gpu-deployment-kit"
license=('unknown')
conflicts=(nvidia-gdk)
provides=(nvidia-gdk)
source=("http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_352_39_gdk_linux.run")
sha512sums=('d31c22d420c1e0907ab12971ae014d8d7ae3b0bc9daf930f4048e046d4d1f239dc4d7cb813f52ca5b381e209ced4d4acc435164683342a4ca7e95e56c24a35a0')

package() {
   sh cuda_352_39_gdk_linux.run --silent --installdir=$pkgdir
}

