# Mantainer: piernov <piernov@piernov.org>
# Contributor: piernov <piernov@piernov.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nvidia-gdk-340xx
pkgver=340.29
pkgrel=1
pkgdesc="Nvidia GPU Deployment Kit"
arch=('x86_64')
url="https://developer.nvidia.com/gpu-deployment-kit"
license=('unknown')
conflicts=('nvidia-gdk')
provides=('nvidia-gdk')
source=("http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_340_29_gdk_linux_64.run")
sha512sums=('3310600ccddf0f79087aa48c61cf7c10bde2543f041571f1bf7c9721a5e41a993e6b231f6b01e37b22062e0b978da7135d89382b9a3a996b82b04283676469ff')

package() {
  chmod +x cuda_340_29_gdk_linux_64.run
  ./cuda_340_29_gdk_linux_64.run --silent --installdir=$pkgdir
}
