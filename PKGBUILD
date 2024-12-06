# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.8.7
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
sha256sums_x86_64=('6935f082ef120fdb05f608dde61ace6b82d134496634586f42c8e38856b3e411')
sha256sums_i686=('36480dfb7ab0f5fbef66b90ba9813bc484826ffbbc857cf1dbc10338f5e3419f')
sha256sums_aarch64=('5ce3686c20c9d639e99a064af5cf0d781361b0874426b2343a9ab4e33d25db4f')
sha256sums_armv7h=('aae911b690924dda3ad18c888f310ae5210e9fdc530c6c5ae38dbd50fb4bbe94')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
