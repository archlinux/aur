# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.9.0
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
sha256sums_x86_64=('638dd3fb9ecfa6fd9f54a0024b195b12b407c51ccee6f83b18a75a8be79f8214')
sha256sums_i686=('bd8d51ebb9e5a88c49c0bce3505e44b28957f2ca3175431a454f8c2883ee08cd')
sha256sums_aarch64=('c66ae849239c2c98bad79e68aae2bd72aac40c03f1071608febcc3a1b51586fc')
sha256sums_armv7h=('78e446bdfd7b1625cddd5d6591b948681f013d0db37645827963d4f3f2469de7')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
