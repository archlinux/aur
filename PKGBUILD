# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer
pkgver=1.0
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source_x86_64=("http://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver//./_}_linux64.tar.gz")
sha1sums_x86_64=('2dcb3b9cf46c6c74c2ce42fa9af6dab2252fce3a')
depends=('vulkan-icd-loader')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}"/usr/bin
  install -m755 vulkanCapsViewer "${pkgdir}"/usr/bin
}
