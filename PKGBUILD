# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.12.6
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
sha256sums_x86_64=('5dc43da4f750f33873dc25e94587128709e819e544b7be9016b255316153c3a8')
sha256sums_i686=('7c6483d41b1151e5e3e2922d6482a94124a3da81a2e9face2bbe6d5211d79e0b')
sha256sums_aarch64=('e573979ba68a17fe7b881752051a694a7efcd970e39521f6a25775197861ed4d')
sha256sums_armv7h=('d60cec374b13d4963e25f5c498a8e16f4ecad452626f818d67839260bdda76ec')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
