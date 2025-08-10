# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.10.4
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
sha256sums_x86_64=('2097663587183670327b7bcf8569b51c93da942087552b824f9e0f774af5dab5')
sha256sums_i686=('e4a1db19329b85273d7af6ec77996a3310642b9f2315b98924a011814ede2431')
sha256sums_aarch64=('df9ddb8b09ddc5b80df43064638ac2fcda6fbd7755fe6a2d342c6b7578192638')
sha256sums_armv7h=('ddaf0f68d65a0b63f82df93a5616719be05824ec0ef42f2a6b9a3b48da5fca30')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
