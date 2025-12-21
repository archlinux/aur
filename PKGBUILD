# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.10.8
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
sha256sums_x86_64=('b330c2f41e416403817b34e611b8ea6622c77d918c2478de3aa060353288530e')
sha256sums_i686=('674c26ad775f57950941ad22e62920bd32336db7446b98ad5906c6a7875c6600')
sha256sums_aarch64=('36a2d1ddfe85653e084bb2c5d0f682f420072b0577caf545f058ef9629d82c59')
sha256sums_armv7h=('4497e4605f56cdc4e126b7b7b0f63f0aca798aef573997b22122f954d9410f6c')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
