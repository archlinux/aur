# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.7.0_alpha1
pkgrel=3
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
sha256sums_x86_64=('38bd34f51f6373adadeeae301d7bee862a026d8b0b2b3aaed92aa325b3d621cc')
sha256sums_i686=('29f8a9368d8cf1bdf9744a4b402a4d1cd8ee649551ded91855c9dfc1ca2b0a07')
sha256sums_aarch64=('c202fd5f4bf3dfd8c5ff7c1d7f13b09bb9dd2565d1798823082920abae453a9c')
sha256sums_armv7h=('317ed2b8937339e36d57a2f23bbc4a3583347c7871cee8f97165db60550e3377')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
