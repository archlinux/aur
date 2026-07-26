# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.12.4
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
sha256sums_x86_64=('f5d2ae8a0efcddd3722546b3e0f2f2f0648ce5e5a3e411176041adcb7dccc1e8')
sha256sums_i686=('1695fe3bd9ff34cd64fbbb41113453b140019a7c1d6df30ce7c5e9a5275fd31a')
sha256sums_aarch64=('a3b01db857c7c650768ffa8ad9119dc2db82fe1b98125b7238392a160aca7f8a')
sha256sums_armv7h=('3bc49a5802265b1345aba1be33266385ac2421548b3c08c7b56201566debd34a')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
