# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.11.3
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
sha256sums_x86_64=('340195f742ba1939078e46010a0f45b620811f986b0051f43748f600eade674d')
sha256sums_i686=('61e9d1ac7a0180066fa4c50c36fc6110fb7fc1e95a84c524f141542b2f19ea65')
sha256sums_aarch64=('18d536624966f02799b3c40e487d7f4bd1dcc946132690f34a29b088d409c1e6')
sha256sums_armv7h=('dc78774ae0357f85b8f75641f0c111dd55fbe99f8ba7d0486e09bd750aeb330e')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
