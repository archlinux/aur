# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin
pkgver=v1.6.0
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
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0/tofu_1.6.0_linux_amd64.zip")
sha256sums_x86_64=("b96c3d1235bc4fd53b199175818a35642e50cbc6b82b8422dcab59240d06d885")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v1.6.0/tofu_1.6.0_linux_386.zip")
sha256sums_i686=("1d5518e4328fa94631d3b8b8e6b10ffdb4a885387bf45961bf5e8de7e48b4992")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v1.6.0/tofu_1.6.0_linux_arm64.zip")
sha256sums_aarch64=("c2058c1e2f2222d81de0ad291eace3e34330cc7b74315eaacb60a5b6402527b1")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v1.6.0/tofu_1.6.0_linux_arm.zip")
sha256sums_armv7h=("96ea9c8af248a3b05e11f986151e3eb6d37fa7334c8f9414e3aa906f9e30ac9e")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

