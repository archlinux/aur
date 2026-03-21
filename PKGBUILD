# Maintainer: Gentleman Programming <info@gentlemanprogramming.dev>
# Contributor: Gabriel Fagundez <gabrielfagundeznievas@gmail.com>

pkgname=gentle-ai
pkgver=1.7.5
pkgrel=1
pkgdesc="AI Gentle Stack - Ecosystem configurator for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Gentleman-Programming/gentle-ai"
license=('MIT')
provides=('gentle-ai')
conflicts=('gentle-ai')

source=("LICENSE")
source_x86_64=("gentle-ai_1.7.5_linux_amd64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.7.5/gentle-ai_1.7.5_linux_amd64.tar.gz")
source_aarch64=("gentle-ai_1.7.5_linux_arm64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.7.5/gentle-ai_1.7.5_linux_arm64.tar.gz")

sha256sums=('19b104292ae35263824a05a795fe9f7cf04b408bf9a77603e9a165802434d4a4')
sha256sums_x86_64=('d323e5e6797c35abb27e052ad6f1534b8f415cf36a952f453aad9242ab9deca7')
sha256sums_aarch64=('d7acd47b7cca845f97bde4bd8d771abe377f85e1b1a27493b2cfe6f54e49a6e6')

package() {
  install -Dm755 gentle-ai "${pkgdir}/usr/bin/gentle-ai"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gentle-ai/LICENSE"
}
