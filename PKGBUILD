# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.11.1
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
sha256sums_x86_64=('bbfaf9baff1e5baf2775a4a9e7ba9e3c0152841f29f4ee7cf4610feb48f2db1c')
sha256sums_i686=('73dc3fe5f5ef6ae4aafc5422b476e22a288d3912819f226452a99eae114efe57')
sha256sums_aarch64=('d83844cc9c9479709b6129727b5b06cbe0a0486752f51b123432c5bffac1d23a')
sha256sums_armv7h=('fe3199336017f578c0850f31ba9176245d65ca8a52691dd623e0ce903e0a0dcb')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
