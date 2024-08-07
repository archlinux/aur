# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.7.1
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
sha256sums_x86_64=('6567b49c43edd2e2670896bb6788b582e7a30fa6c9ee9fa07b9e613cfb219874')
sha256sums_i686=('91d659b820bf73dd11c9ea724cc7b4f5c046c59e314b0cae281283fd05f6e22b')
sha256sums_aarch64=('27a80a9e4f376ecbd336821b2d41ada797af4e385714fb348b7234e21beeecbe')
sha256sums_armv7h=('5284c7e1e6a7a74f6482b982f5d1a0a4ad13478b0dbd661613d1da570ea244ff')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
