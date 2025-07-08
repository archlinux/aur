# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.10.0
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
sha256sums_x86_64=('ff8aebfd069f15f3f9ba7814444c8cae05428314c2ded0faedb9d040f6936cdb')
sha256sums_i686=('37660a8ad599324576918aa7dc54265011fb4d14d00208f12b04785f2502a4f9')
sha256sums_aarch64=('289e7264c747845c07d7700c72b32c78180fb6bd1182b8a8557b2ab5567cca26')
sha256sums_armv7h=('ca36df077b35b21daceccdc8d2bd689e59360897efc25a9d4c4140468616b8b8')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
