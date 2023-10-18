# Maintainer: Jener Rasmussen <aur@jener.me>
pkgname=opentofu-bin
pkgver=1.6.0_alpha3
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
sha256sums_x86_64=("bb1b65d5bffea4e1f840af2c32290d4c11ca27e3c55a386da89f5f014cf33196")
sha256sums_i686=("9c2544f3726a841eafe56b866658f2f3d59fc357b2f3c8b23c41b465efcb2854")
sha256sums_aarch64=("2b94de7dd206610e0d0d32d216c4001d32cea6bfe35a1b4630db5f17d92f03e3")
sha256sums_armv7h=("764144adca31bfbb12e7828242ed88ab3f436c8ff32b1cc8f06052a5b8809e5e")

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}

