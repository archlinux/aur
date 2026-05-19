# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.11.8
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
sha256sums_x86_64=('797af5739a1b944dd59190d618df8f969d539477e9b88fb561eecd7fa4b76b7c')
sha256sums_i686=('fb2dabb7f649afd940e64c34ddcdb2a56cda652579ff638db74fb24b04d61056')
sha256sums_aarch64=('cba4cfec87d62ba4ef2ab0e12295a0bd29c2e734c6f5f8881b0cbc8e255109de')
sha256sums_armv7h=('9ab90750e0cd1110332ebad02228c4f25a9a78c92dba96fdacf0a7727bb9064d')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
