# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="OpenTofu lets you declaratively manage your cloud infrastructure."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://opentofu.org/"
license=('MPL2')
provides=('opentofu')
conflicts=('opentofu' 'opentofu-git')
replaces=('opentofu-bin-stable')
depends=()
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_amd64.zip")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_386.zip")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm64.zip")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm.zip")
sha256sums_x86_64=('a4d755f86968cc0278c636c044972c43c28825d7d1af167bddd0470b2318c2c2')
sha256sums_i686=('b1d7c32401da7c285cc6a820272e982597922ad13be449f77409aa1f4d80aafb')
sha256sums_aarch64=('86a6db50a990b35bd53a7d18c7336c80c768998d1ebd6c3c8387bb030cffcbc7')
sha256sums_armv7h=('2acdb7a373b286dea4d5041911466a0954b313c8ef9f216317695f63f28bdd2a')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
