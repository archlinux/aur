# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=anything-llm-appimage
pkgver=1.20.0
pkgrel=1
pkgdesc="All-in-one AI desktop app: local or cloud LLMs, RAG and AI agents over your documents (AppImage)"
url="https://github.com/Mintplex-Labs/anything-llm"
arch=("x86_64")
provides=("anything-llm")
conflicts=("anything-llm")
license=("MIT")

source=("anything-llm-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/AnythingLLMDesktop.AppImage")
sha256sums=('bf101b602c590eae0a96e96c3fac609763565f4ad39f860434ed50ce2480daad')

package() {
  install -Dm755 "anything-llm-${pkgver}.AppImage" "${pkgdir}/usr/bin/anything-llm"
}

