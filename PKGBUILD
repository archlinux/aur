# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer
pkgver=1.1
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source_x86_64=("http://vulkan.gpuinfo.org/downloads/vulkancapsviewer_${pkgver//./_}_linux64.tar.gz")
sha1sums_x86_64=('971bb05dcce1229d43112955243d9358a78ae1b3')
depends=('vulkan-icd-loader')

package() {
  cd "${srcdir}"/vulkancapsviewer_${pkgver//./_}_linux64
  install -dm755 "${pkgdir}"/usr/bin
  install -m755 vulkanCapsViewer "${pkgdir}"/usr/bin
}
