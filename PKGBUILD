# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.11.5
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
sha256sums_x86_64=('901121681e751574d739de5208cad059eddf9bd739b575745cf9e3c961b28a13')
sha256sums_i686=('ff6f4d671434f4c85aace648e066d3bb4d4a47921517df90c01fa01bfd1c4d48')
sha256sums_aarch64=('1b79f8fe3cbf7ac0540507bb6bd0ecab1675c78393bbf492867eaabb79840eec')
sha256sums_armv7h=('b1837e9431f759a17865698ab300ddf0c25e33a593e2d88635fe05d564658b24')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
