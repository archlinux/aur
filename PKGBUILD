# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.10.3
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
sha256sums_x86_64=('acf330602ec6ae29ba68dd5d8eb1f645811ae9809231ecdccd4774b21d5c79bc')
sha256sums_i686=('957e9b13dd5504e960e6e8dd80f2da21a0344fa3fac2d055fe7dbc48171444c6')
sha256sums_aarch64=('7011e9da95299dc8f8eaf4a54ebe066982ead04de778505dfbcaf406de25519a')
sha256sums_armv7h=('f3ae6a7a344bb7ac92399e825a559d664968a33ddc5d5d839b050d33699ee757')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
