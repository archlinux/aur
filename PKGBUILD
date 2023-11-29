# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin
pkgver=1.6.0_beta1
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
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta1/tofu_1.6.0-beta1_linux_amd64.zip")
sha256sums_x86_64=("ca820360c86b2cf149eece06ce4d5ea27345e62def2e82296f135db20c806fad")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta1/tofu_1.6.0-beta1_linux_386.zip")
sha256sums_i686=("44aa67b939d112c4e56a2df620fe6502c5e58079043fa134c4c4a934b6647d0c")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta1/tofu_1.6.0-beta1_linux_arm64.zip")
sha256sums_aarch64=("8f762c292d69b41d8b37dddab0f69ea77d06e70626cf2fb993a979eee1c26f04")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta1/tofu_1.6.0-beta1_linux_arm.zip")
sha256sums_armv7h=("b5cd976c9c6929c4bd4ea7839bfa461a3d8168ad2eeeef06178ccf33e392e1b0")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

