# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin
pkgver=v1.6.0_beta4
pkgrel=1
pkgdesc="OpenTofu lets you declaratively manage your cloud infrastructure. "
arch=('x86_64'
    'i686'
    'aarch64'
    'armv7h')
url="https://github.com/opentofu/opentofu"
license=('MPL2')
provides=('opentofu'
    'terraform')
conflicts=('opentofu'
    'opentofu-git')
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta4/tofu_1.6.0-beta4_linux_amd64.zip")
sha256sums_x86_64=("99707716baccddcb49273ac81a8d041084403da269278db74f2512892499ae63")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta4/tofu_1.6.0-beta4_linux_386.zip")
sha256sums_i686=("f11cd4062c5a4a7bcf0728abf2b84c4ea89afc511813e1f0bc0ad61c01bc15ea")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta4/tofu_1.6.0-beta4_linux_arm64.zip")
sha256sums_aarch64=("d783674ff59f1822422e29fb4cc9e2a9fa4b2d0a07cbb812ca43d9045e03d154")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta4/tofu_1.6.0-beta4_linux_arm.zip")
sha256sums_armv7h=("93a0d2e2c5a820fe8942d84550364cb455c45bd81976db6f776b0a50bf0c3e17")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

