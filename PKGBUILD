# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin
pkgver=1.6.0_alpha5
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
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-alpha5/tofu_1.6.0-alpha5_linux_amd64.zip")
sha256sums_x86_64=("b245b51f9502af2932f4b5d230c14d43f644bb58be65246cfc13fd6c32505195")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-alpha5/tofu_1.6.0-alpha5_linux_386.zip")
sha256sums_i686=("bd27822149c076143fb2777ffc29f5e78d1086e8f6175ad99957763e067c4885")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-alpha5/tofu_1.6.0-alpha5_linux_arm64.zip")
sha256sums_aarch64=("4c32eebb62b43637e7ec2dcc2347e64e4587b0bfe544ea097e8bc1c3473391a0")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-alpha5/tofu_1.6.0-alpha5_linux_arm.zip")
sha256sums_armv7h=("b7be50c3529b7e281fd14fbdeb3b0a0872ea7a6ef0126724da13af5ce40fd022")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

