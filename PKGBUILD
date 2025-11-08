# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.10.7
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
sha256sums_x86_64=('c79bb458e7d7fa08c44be98b373ab3434647598808fc2a75dc9338aef7432ae6')
sha256sums_i686=('5fdfa215f22786ce262db04e5f916187a09731e78ca638dcaaa9ff11a4418823')
sha256sums_aarch64=('8870063fa5cea26c5937d295af7b2e1c340dc86d2b86a957ca66ed21d9ca8d42')
sha256sums_armv7h=('02a3f6e44cd4865bc0ed6d856ccaf77a0bd2f47a2925e0ac86a95d2d4874af71')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
