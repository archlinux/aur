# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.12.0
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
sha256sums_x86_64=('8d7650fd42b6d790f9f747604393ccd0a9035376bccc4f1688b905d7c5bb1137')
sha256sums_i686=('bea5edfed4f580a5d29fe30a13f8d054e9aeacc1855aeced659339d123ee060d')
sha256sums_aarch64=('466bf912404b4ab0f0b3a043073d68ad34f11d55ad7a483957d94f0733169f8d')
sha256sums_armv7h=('872a080cd29cab683bfa9c2427c831c0f5748467a3cdce01902e3bfd264b202f')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
