# Mantainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nvidia-gdk
pkgver=352.55
pkgrel=1
pkgdesc="Nvidia GPU Deployment Kit"
arch=('x86_64')
url="https://developer.nvidia.com/gpu-deployment-kit"
license=('unknown')
source=("http://developer.download.nvidia.com/compute/cuda/7.5/Prod/gdk/gdk_linux_amd64_352_55_release.run")
sha512sums=('87797c18ba91eacdfcdef7d93ad07501913b0d5047814a40d7b3cafa6c8624c72b1dce5289150d07425812ed5f5cf046a877177d92ebe1efb7d83c7b1945f851')

package() {
  chmod +x gdk_linux_amd64_352_55_release.run
  ./gdk_linux_amd64_352_55_release.run --silent --installdir=$pkgdir
}
