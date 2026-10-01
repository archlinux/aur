# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.12.7
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
sha256sums_x86_64=('6807f7ae2a33e254c104da54e628b40aa6fc50d4becd78c43574fe250add33e9')
sha256sums_i686=('361d7944447f648593eb0fc02de3390c94589eb485fe009dde36fce37331ddad')
sha256sums_aarch64=('a63fc6bfef855c5362c969808253d526abb308a9dc625c0f192f3adbe5d364cd')
sha256sums_armv7h=('e75ebe41413d05aaf8f1b9da84e297fb81cb51b27d46e8a054d3c269288b813c')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
