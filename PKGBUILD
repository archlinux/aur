# Maintainer: Gentleman Programming <info@gentlemanprogramming.dev>
# Contributor: Gabriel Fagundez <gabrielfagundeznievas@gmail.com>

pkgname=gentle-ai
pkgver=1.5.5
pkgrel=1
pkgdesc="AI Gentle Stack - Ecosystem configurator for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Gentleman-Programming/gentle-ai"
license=('MIT')
provides=('gentle-ai')
conflicts=('gentle-ai')

source=("LICENSE")
source_x86_64=("gentle-ai_1.5.5_linux_amd64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.5.5/gentle-ai_1.5.5_linux_amd64.tar.gz")
source_aarch64=("gentle-ai_1.5.5_linux_arm64.tar.gz::https://github.com/Gentleman-Programming/gentle-ai/releases/download/v1.5.5/gentle-ai_1.5.5_linux_arm64.tar.gz")

sha256sums=('19b104292ae35263824a05a795fe9f7cf04b408bf9a77603e9a165802434d4a4')
sha256sums_x86_64=('15fc7af1e126fde068cf3ab95686d309bf44190bdee0e87712601fde92f26285')
sha256sums_aarch64=('f09b22c5e9f05ce8cf23f3ac6e575bbf1b0f552b6336d28f0d636db167add58b')

package() {
  install -Dm755 gentle-ai "${pkgdir}/usr/bin/gentle-ai"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gentle-ai/LICENSE"
}
