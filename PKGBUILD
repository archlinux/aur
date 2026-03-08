# Maintainer: Gentleman Programming <info@gentlemanprogramming.dev>
# Contributor: Gabriel Fagundez <gabriel@gentlemanprogramming.dev>

pkgname=gentle-ai
pkgver=1.4.1
pkgrel=1
pkgdesc="AI Gentle Stack - Ecosystem configurator for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Gentleman-Programming/gentle-ai"
license=('MIT')
provides=('gentle-ai')
conflicts=('gentle-ai')

source_x86_64=("gentle-ai_1.4.1_linux_amd64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.4.1/gentle-ai_1.4.1_linux_amd64.tar.gz")
source_aarch64=("gentle-ai_1.4.1_linux_arm64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.4.1/gentle-ai_1.4.1_linux_arm64.tar.gz")

sha256sums_x86_64=('0703b3fe506d04f46b43d9a0fb44206160bd37794432ba013c5c2cf15f656589')
sha256sums_aarch64=('92896bd7f46b1c34c7b0e3a23dab2e825b8e38a5b4b205006e1bd20a6fb4fa88')

package() {
  install -Dm755 gentle-ai "${pkgdir}/usr/bin/gentle-ai"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gentle-ai/LICENSE"
}
