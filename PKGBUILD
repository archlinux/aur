# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.13.1
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
sha256sums_x86_64=('8ccbc6f8ee21d2827715f3c6e08a9b3e0209b1e62057c05067ef117e047c1a80')
sha256sums_i686=('c1e5cbcc0bfea6fd580cdd4a66cb130f72090ab4d8c738d6113a805adc7b1117')
sha256sums_aarch64=('b9614df40575cc3fc10a8a25025b7245d961da279f715ea3efff4ddae8e6938a')
sha256sums_armv7h=('996a3e97fe68c03d883a242af4c1cb86be12dd795580c551489b776df9e4642f')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
