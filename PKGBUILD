# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.13.0
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
sha256sums_x86_64=('ad494034a03aaa66d93fc1c2c164d01bedf21b44cfb8b616182cb69424a67672')
sha256sums_i686=('1b85ad81628ced3dda01ab0e02bbbc324f3605028a05b4c39b94464ce2635ced')
sha256sums_aarch64=('34dfd5c6d7de0372789d92dc0db52a9c710edac7cc2abef404a76a1fae6f2ef8')
sha256sums_armv7h=('6554c4eac244f40deb29115f988d89754d45ef1c836c53f5bd20e444c1c05058')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
