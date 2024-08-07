# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.7.2
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
sha256sums_x86_64=('da88364f7a892c0143bdf6e529d976498ce943910fd0840250fd227f983b5434')
sha256sums_i686=('4992452b197627717be9a0841594817aaf4a55ab6fa8a5111f8dfd20da8d5a28')
sha256sums_aarch64=('10352504bb0e57a1223fc585e06e896f4035e585d634c5805fae6ea3f745712c')
sha256sums_armv7h=('6ff54cbd5d0d258c7f78feba057168560b39158c7e5b9e0b961c10ad2c5bc4ac')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
