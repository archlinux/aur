# Maintainer: Gentleman Programming <info@gentlemanprogramming.dev>
# Contributor: Gabriel Fagundez <gabrielfagundeznievas@gmail.com>

pkgname=gentle-ai
pkgver=1.7.3
pkgrel=1
pkgdesc="AI Gentle Stack - Ecosystem configurator for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Gentleman-Programming/gentle-ai"
license=('MIT')
provides=('gentle-ai')
conflicts=('gentle-ai')

source=("LICENSE")
source_x86_64=("gentle-ai_1.7.3_linux_amd64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.7.3/gentle-ai_1.7.3_linux_amd64.tar.gz")
source_aarch64=("gentle-ai_1.7.3_linux_arm64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.7.3/gentle-ai_1.7.3_linux_arm64.tar.gz")

sha256sums=('19b104292ae35263824a05a795fe9f7cf04b408bf9a77603e9a165802434d4a4')
sha256sums_x86_64=('fa98165fbbf900f8f2fac3be308c0de7452aee2d1a012b02bced2b57c900adf1')
sha256sums_aarch64=('0ed80a28b1bdd4f044c40133ecca6667878f1fb09dab8b10ece347266a411b29')

package() {
  install -Dm755 gentle-ai "${pkgdir}/usr/bin/gentle-ai"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gentle-ai/LICENSE"
}
