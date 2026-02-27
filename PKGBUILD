# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.11.4
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
sha256sums_x86_64=('f3907e96b5a9f2fce311078ca273bcdf1e13980dac150b2549932c26b515c61b')
sha256sums_i686=('332689fdc68bdeedc5ce331bd2ccbe168550f9f600cc4af0eaa801e6e4d5c834')
sha256sums_aarch64=('f877d46cb911d40bc0b81818d1940afdd356f632bcac48ca19dd8f7802a86701')
sha256sums_armv7h=('67d66ba3f1b1f6f2b33a0dc929fb9e46640b975b8be3ff980bda484002e4a30e')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
