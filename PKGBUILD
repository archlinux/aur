# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=anything-llm-appimage
pkgver=1.19.0
pkgrel=1
pkgdesc="All-in-one AI desktop app: local or cloud LLMs, RAG and AI agents over your documents (AppImage)"
url="https://github.com/Mintplex-Labs/anything-llm"
arch=("x86_64")
provides=("anything-llm")
conflicts=("anything-llm")
license=("MIT")

source=("anything-llm-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/AnythingLLMDesktop.AppImage")
sha256sums=('8b407abafa281e5f2b58af04399011784894a5a0414fb58eb32062dad6cc8ef2')

package() {
  install -Dm755 "anything-llm-${pkgver}.AppImage" "${pkgdir}/usr/bin/anything-llm"
}

