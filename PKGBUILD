# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.12.2
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
sha256sums_x86_64=('dc0ad16a42b3bfb5f3ceff3dcd5e9cd4c55271fae9f4bfe611749ff8ae6ec23c')
sha256sums_i686=('e01b958b9e56b4404f08ed694c5ba431ff1fa18f35517b782f6c4243ba0bd829')
sha256sums_aarch64=('360a2f238c100818851917531f1ead80c1bda960f9f38f965820fa85fd5147a7')
sha256sums_armv7h=('339985b8f9a3a02acbc66729f5707f34539be5171d7ae975cea72e7f5f09d43a')

package() {
    install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
