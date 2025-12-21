# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="OpenTofu lets you declaratively manage your cloud infrastructure."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://opentofu.org/"
license=('MPL2')
provides=('opentofu')
conflicts=('opentofu' 'opentofu-git')
replaces=('opentofu-bin-stable')
depends=()
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_amd64.zip")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_386.zip")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm64.zip")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm.zip")
sha256sums_x86_64=('c425c2080e3f204a1fe094356777535a34c4bc9fdbca4eccb74cdd25c1ae8a94')
sha256sums_i686=('00b0b1ad0d064a43f8fe0692e912db0c19ad050fe051e52088d34d80b9b18767')
sha256sums_aarch64=('be01f174589a6f95ef3401d6514c32a01c0812fb14bfdd8883868089a6a833a2')
sha256sums_armv7h=('ece2679de841e0dfcb5eea293d4b852ea0d095479eabd61d9d189b8a5e6481f3')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
