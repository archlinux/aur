# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.8.5
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
sha256sums_x86_64=('e2951ba6be8ae9427aabbd5c6f243855e8b526cb2ae6bc33a05dae22d7e82632')
sha256sums_i686=('0a15fd191509db47991cf042f85c7390fb789643ef790688ce37b6c17d9ea0dd')
sha256sums_aarch64=('2535e8d4979806cbf79a1b704dccf1fae45b4d50ccaee3e54c1771044db4a573')
sha256sums_armv7h=('d1c7d6505a9e27ee79ba75f2a9849e6ce56e3e13f25916f067330c045567b0b3')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
