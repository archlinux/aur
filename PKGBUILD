# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.8.8
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
sha256sums_x86_64=('9e889633bc177b1d266552658020fe8ceb839445fcac82aaa7622952fd9c81bb')
sha256sums_i686=('714c990c60e86dd1bfd1aed2bdb5a36d321d6672e5381025bb373d1c357abb5d')
sha256sums_aarch64=('9559df2e37f6c8d49120c6fc038933e4b8ad3927014445ea67f81ae8c0271e70')
sha256sums_armv7h=('b3398b60d12ff5c13ead896e1166c6ee34eaeedd6b078adc438e28aa018609b7')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
