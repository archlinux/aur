# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin
pkgver=v1.6.0_beta2
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
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta2/tofu_1.6.0-beta2_linux_amd64.zip")
sha256sums_x86_64=("255055c8ae5760448e13e6ef9ff7bbccabeb4e5662faa770ca042d2988f21a18")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta2/tofu_1.6.0-beta2_linux_386.zip")
sha256sums_i686=("8995ed0e66623ce5d01d332cbac312fe6cdf059fb37ff42339dd9242cd1dd49e")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta2/tofu_1.6.0-beta2_linux_arm64.zip")
sha256sums_aarch64=("216629c0dfe1d4370218c11dcdbae6f08ce2c1e4667d4fd9acc667613516aac3")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v1.6.0-beta2/tofu_1.6.0-beta2_linux_arm.zip")
sha256sums_armv7h=("dff93f1405843c310def56a7ba4313b850e3505e877f1c0bddd73c53086dbbc9")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

