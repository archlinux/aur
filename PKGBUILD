# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.11.2
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
sha256sums_x86_64=('1bfb425c940098952df7a74e2f67dd318614bbea2767a25de94e46ca5d5b85ec')
sha256sums_i686=('ddc8f3dc61fc29ad4f670416d7580e8c68fbd4dc990d90a387b0c54431c232ff')
sha256sums_aarch64=('75890027faba15bb86bcb413b988b9d50a66d9038f869371486941c1ae545be3')
sha256sums_armv7h=('d32b637695a5bbf68838ddb8698850555cc3d7c5e68a65b9f411b6ccb2d8ac8e')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
