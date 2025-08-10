# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.10.5
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
sha256sums_x86_64=('d4fd8ee4c370eaf4b80a4e98fed2fccbdcd117b0603129ff3478b8cb492c7670')
sha256sums_i686=('902203b72c4d704df43fe1ca74dec48b908cb0ba2b6f1985ae6eda238c9e798d')
sha256sums_aarch64=('a5192eb96d61a7639939162e85e5b946d8a60e5af5925b066f6e72e17d51e712')
sha256sums_armv7h=('880debb6315a34b6c53ba8106c330c8b33a8d9b74458813988b5e128fe36dd2d')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
