# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.9.1
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
sha256sums_x86_64=('19eda43eaa45bef3e21d87c58f31a6df73e8534ea30e78619a463bdfdb889cd2')
sha256sums_i686=('391ce077caa513d8c0bc6cffc05a6e7fcb1c3ede00981128a76f20f797cbec6c')
sha256sums_aarch64=('733f41baef5923178385c1fc441140988aa98ba41e7669def97e3418347b4ed6')
sha256sums_armv7h=('f6ca41f1f48fc9539b4f1431e419248992b6a772fbca5d4071544f6cc2037835')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
