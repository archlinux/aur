# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.8.2
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
sha256sums_x86_64=('3c0cf737e6b6a4520c26c5bbd90f6b432b9741dbc9214fd5eeb8b68606ac4915')
sha256sums_i686=('3b2e43089c98c2f15e2fa5b8b197731a8c7809d2268e335f1ac7e9a044a2d8e6')
sha256sums_aarch64=('d39651ba37f7abb7172d91bc14936129d3157525a2b6a2bfb5d1747e53f1d7a7')
sha256sums_armv7h=('dc245294f4237ab0ad57652e960f7d81d2aa6359dceea8ef32b035bbbc3bf514')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
