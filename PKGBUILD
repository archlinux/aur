# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.10.6
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
sha256sums_x86_64=('15b7bed76420b50da3e121769c43341df8cd57d751ca14e6dbe9c850124c6dac')
sha256sums_i686=('8eede35e4a143310596030d2720a953e42b32b7c7d87adebd992683e49778282')
sha256sums_aarch64=('a32f653d686a8cad9b9be82101eb5b5e834fbfa8d095842fa1820c5d27fad967')
sha256sums_armv7h=('b14aba1ad177c78f101ab3cffbbfd3615a8107ddbbfb08d3364d38d459bced76')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
