# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin-stable
pkgver=v1.6.2
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
    'opentofu-git'
    'opentofu-bin')
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v1.6.2/tofu_1.6.2_linux_amd64.zip")
sha256sums_x86_64=("18277462e0ded513e47fb3e041911dfd14f4ad3721d53ee2f0c709fa810b8cf0")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v1.6.2/tofu_1.6.2_linux_386.zip")
sha256sums_i686=("9f2c0cf19cca20ef9ed2e3100ebe49d3752ca8a1bb8ef3551f2994913e2008b4")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v1.6.2/tofu_1.6.2_linux_arm64.zip")
sha256sums_aarch64=("410f52729866ddd41e1ab1acab1e03110e947ef5362093895f96fc15f920268a")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v1.6.2/tofu_1.6.2_linux_arm.zip")
sha256sums_armv7h=("c858d1ece5404afa6a39aad9e9dd945d3855217239cd1c0b2f1603b935f66095")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

