# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin-stable
pkgver=1.8.0
pkgrel=2
pkgdesc="OpenTofu lets you declaratively manage your cloud infrastructure."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://opentofu.org/"
license=('MPL2')
provides=('opentofu')
conflicts=('opentofu' 'opentofu-git' 'opentofu-bin')
depends=()
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_amd64.zip")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_386.zip")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm64.zip")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm.zip")
sha256sums_x86_64=('f9390d6b6b7329fe77acb9f911ae90761be755ef311199b4853330d08b9f14bd')
sha256sums_i686=('f104fff7c20ddb390dd1e668d563eba1700f59a30989763b375748af99a2452a')
sha256sums_aarch64=('eb34589827a50caea9712fa6be00c951cd40a0f8d28b5bd0302aa5609ba5052a')
sha256sums_armv7h=('e0711cd04d42035cf4db0ad1c1bbfd2b9af02f177369067349e37e88c1fc2682')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
