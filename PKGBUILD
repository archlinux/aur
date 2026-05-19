# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.11.7
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
sha256sums_x86_64=('2ae4434e08da9a17372c11509d11b07f1cb3730dea0bf7ff658bdb4b83b1cbab')
sha256sums_i686=('3ef0537a75fb615290215240166903b1f91dcf1df285f2a5933f2656d9cf2b77')
sha256sums_aarch64=('5b3134038c99539768b9d685e3f9d593f498a46ef6ac5ed824ce5a8d5d12c415')
sha256sums_armv7h=('e4536e78e545d7770a68f63e125aa12b8e10810fec48fc78c19171d20afbc4a7')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
