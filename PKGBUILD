# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin
pkgver=1.6.0_alpha4
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
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-alpha4/tofu_1.6.0-alpha4_linux_amd64.zip")
sha256sums_x86_64=("3ee733c7d67a39d464df9c624615d5dce076b818ddfe4910cfcc1d980e0bbffe")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-alpha4/tofu_1.6.0-alpha4_linux_386.zip")
sha256sums_i686=("127ee46807ee4d62cd4b1ef6916fff99f4f5b51421d861dbbfdb7da381ea2527")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-alpha4/tofu_1.6.0-alpha4_linux_arm64.zip")
sha256sums_aarch64=("5c949cd601f7fca770de91ba05a1c5ab7c8c990788da8a729ed9b5aaf3f28dde")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-alpha4/tofu_1.6.0-alpha4_linux_arm.zip")
sha256sums_armv7h=("1c9900bf31356c3fc9274e2affde6f83c1aeeda0589357189c19e3bc9a2b99fb")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

