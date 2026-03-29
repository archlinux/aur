# Maintainer: Gentleman Programming <info@gentlemanprogramming.dev>
# Contributor: Gabriel Fagundez <gabrielfagundeznievas@gmail.com>

pkgname=gentle-ai
pkgver=1.14.2
pkgrel=1
pkgdesc="AI Gentle Stack - Ecosystem configurator for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Gentleman-Programming/gentle-ai"
license=('MIT')
provides=('gentle-ai')
conflicts=('gentle-ai')

source=("LICENSE")
source_x86_64=("gentle-ai_1.14.2_linux_amd64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.14.2/gentle-ai_1.14.2_linux_amd64.tar.gz")
source_aarch64=("gentle-ai_1.14.2_linux_arm64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.14.2/gentle-ai_1.14.2_linux_arm64.tar.gz")

sha256sums=('19b104292ae35263824a05a795fe9f7cf04b408bf9a77603e9a165802434d4a4')
sha256sums_x86_64=('2eb619f4d001bb49a71ddb53f3cbca22592cdf47b4eece189ce1237cbe52b426')
sha256sums_aarch64=('74c036d64e104c57f3dd6808f1e831f370211480a575b3d451ebc94b9e30db58')

package() {
  install -Dm755 gentle-ai "${pkgdir}/usr/bin/gentle-ai"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gentle-ai/LICENSE"
}
