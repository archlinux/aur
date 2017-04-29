# Maintainer: Adria Arrufat <adria.arrufat AT protonmail+aur DOT com>
# Contributor: Sami B. <spidermario@free.fr>
pkgname=cudnn
pkgver=6.0.21
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('proprietary')
depends=('cuda')
source=("http://developer.download.nvidia.com/compute/redist/cudnn/v6.0/cudnn-8.0-linux-x64-v6.0.tgz")
sha256sums=('9b09110af48c9a4d7b6344eb4b3e344daa84987ed6177d5c44319732f3bb7f9c')

package() {
  mkdir -p "${pkgdir}/opt"
  cp -r cuda "${pkgdir}/opt"
}

# vim: ft=sh syn=sh et




