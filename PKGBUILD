# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin
pkgver=1.6.0_alpha2
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
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_amd64.zip")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_i386.zip")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm64.zip")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm.zip")
sha256sums_x86_64=("90cfb45685c124e88d8bb2d59061468177b23666c74214b1aaedf4f2e398d977")
sha256sums_i686=("88d6c9336ba7aa1934bac923e921908d919ae41fa917c2829a56592adc68cd34")
sha256sums_aarch64=("071edcd082320f730374eff91aa30d5a2d3e76a6dd60d58b2da74a0fd92257a3")
sha256sums_armv7h=("071edcd082320f730374eff91aa30d5a2d3e76a6dd60d58b2da74a0fd92257a3")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

