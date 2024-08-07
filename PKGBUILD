# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin-stable
pkgver=1.8.1
pkgrel=1
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
sha256sums_x86_64=('16056d220f3b9de1d494c38717aeda4a0c7c2b9ccaa1f31d4ffc45ba05c8537c')
sha256sums_i686=('219dbd3ad7ee154509004e7e310a75077740f2dbe4c5a9b785b5c6efee9055d2')
sha256sums_aarch64=('e324957e5cafe136e26f8a38df52a9ca3404cbc17924744f069e10c00f509948')
sha256sums_armv7h=('096a35dcc4116f53be3a578826f2f04bf5f89a96a215ed50cc297841a3975667')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
