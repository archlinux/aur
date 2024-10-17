# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.8.3
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
sha256sums_x86_64=('dc44b452a407648a40900eea5ceca2dd586dd084ae085863dba997331dcf8225')
sha256sums_i686=('32f98354e538e6cdcc0da49bbf4c8518c27ca9a0dbb9f477fd6e2ecded16e8bd')
sha256sums_aarch64=('c3ea55a86aaf22729be63371176fdefa40ae9632a6b620c64b98d7fb3a13205e')
sha256sums_armv7h=('63b37a20c00274d74821bc8d0826898c992e9c36befb506132bdcd1a2ca09d2f')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
