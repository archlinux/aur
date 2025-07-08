# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.10.1
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
sha256sums_x86_64=('e90b948d2606d7c69653ddbb9319c2edb8c229f091950a21f3e198f621d888a9')
sha256sums_i686=('e42dbfc8d6b86cbd7363be7db9254da732b53efb9a02eb6ac26c5baa06fcbe61')
sha256sums_aarch64=('102ca3c409da379f13baf272d0301afcd4f5e4a558970b7bc4473f2f286d4598')
sha256sums_armv7h=('5ad7dbc5f088a6ce60606493d1ade660b13559a15d1950dff5d0326117860133')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
