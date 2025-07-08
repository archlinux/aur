# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.10.2
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
sha256sums_x86_64=('cb5fad28fc5e66c3ae8f443cb3902e7ed6657dc96d076572ac6609ac4db7b5e3')
sha256sums_i686=('ae8ee248a609aa32ba6834d8abadb8d3665337f5a1430c3933bc662d3b24ebec')
sha256sums_aarch64=('f6e063fe2112d6c121f690c396d63949bef37142ba8b4c1f29b812771a7a7ee7')
sha256sums_armv7h=('900237562322778dafc7f85f6b1e82d80baa9aacc8c8d6bcc11dc638c8b3aded')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
