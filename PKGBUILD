# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.12.3
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
sha256sums_x86_64=('46b48c3438c65cf479fc076c9281422ffa2f493548d1e813d154c835c5986a08')
sha256sums_i686=('4312c3ddabf4d6285cdce1b247622107809e7ad2d8d7b799f2de77abc27d8270')
sha256sums_aarch64=('b2110d1ce46e366ce861b7f53d293dad99080075629aed7fb50d7328916d91c2')
sha256sums_armv7h=('25b3cdd8ae000cc316d6fce085968b94a8574d30635bdd959eb14b17ca0777c7')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
