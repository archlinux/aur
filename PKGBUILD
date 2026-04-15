# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.11.6
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
sha256sums_x86_64=('68026be376f8910a318645acc65f21da8b39ab86946cb0dd6cd16ef1705f34b3')
sha256sums_i686=('260c39383fe2b53a37dbe6c8fb6bf483a4ec98a60fb225138172f4cf1a0afd1b')
sha256sums_aarch64=('273f107f1f64734fcae4753796803a24b86ae0c383e433ab64bd5542ccd18772')
sha256sums_armv7h=('d1cdd7f502973cc206e7b7cc8850a8b7e64c26aa101b05df5198f71c6dedf9f6')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
