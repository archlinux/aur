# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.12.5
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
sha256sums_x86_64=('dade9650e6b74fc7a8b986bd8717497d32f9e09cf82e479afef4977fa3085536')
sha256sums_i686=('018870f8b0efd78aaab785e7b8989faf3dfb6fe08d01eb28abe7b41cd306a501')
sha256sums_aarch64=('528f4eea63452bbddb30fa4f1780b57fac8d7676f9dda0f772e847bb62c1260a')
sha256sums_armv7h=('30e6fa569d22300b769a0a50ef51af0f3002e37bd11290f817cd363b357f2e69')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
