# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin-stable
pkgver=v1.7.3
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
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v1.7.3/tofu_1.7.3_linux_amd64.zip")
sha256sums_x86_64=("ac67f9bb8fd701ebf1764901876757aea3ab36a9da894c933b229d0cbe2153ed")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v1.7.3/tofu_1.7.3_linux_386.zip")
sha256sums_i686=("ce7747e3b783a40dcb59edfc051091a506b0bad09d678cb097cea15e3413ce37")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v1.7.3/tofu_1.7.3_linux_arm64.zip")
sha256sums_aarch64=("2a78644969e91ba509afa681a71abd6815aec9822057bb796a9c237df0248ca8")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v1.7.3/tofu_1.7.3_linux_arm.zip")
sha256sums_armv7h=("dee8d635923310287a150eeb638c8a38b8cb959fc4e167972c332fb918e14e35")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

