# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.12.1
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
sha256sums_x86_64=('1fc9af962e3632b7cd0ba27076cd9f1ced177567defe9e331ac37f5a40468575')
sha256sums_i686=('1a4213ba2b7ef2a3bec0cd6015cb40f52fc314a08eb120560bf9195ae36e1a11')
sha256sums_aarch64=('1a53dd57697dc04d243ddb81a0f70e44ab83c256f15dde173e5538120dc6a0bb')
sha256sums_armv7h=('5e473d0ff6b637f84f99d8ca385c4705285df6e7f35a71c43761a66b8b2b1944')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
