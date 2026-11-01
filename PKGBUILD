# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Jener Rasmussen <aur@jener.me>

pkgname=opentofu-bin
pkgver=1.13.2
pkgrel=2
pkgdesc="OpenTofu lets you declaratively manage your cloud infrastructure."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://opentofu.org/"
license=('MPL2')
provides=('opentofu')
conflicts=('opentofu' 'opentofu-git')
depends=()
source_x86_64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_amd64.zip")
source_i686=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_386.zip")
source_aarch64=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm64.zip")
source_armv7h=("https://github.com/opentofu/opentofu/releases/download/v${pkgver//_/-}/tofu_${pkgver//_/-}_linux_arm.zip")
sha256sums_x86_64=('723bebb0df8411daff1e5fc3862e28ff5581fe5634087f4c29a9aa41d78208b5')
sha256sums_i686=('c6a3e5002bfe940ebbab869702403ff62dda4ff70709f384650c5ef8841e18cc')
sha256sums_aarch64=('6e815c58a09ee957de606ff48cefad082942e70afc43b737ff975654c54ec453')
sha256sums_armv7h=('5d6295183b8eec0820d2f922d8c604548c2104b17776809430e697fa3d3f64f4')

package() {
  install -o root -g root -m 755 -D tofu $pkgdir/usr/bin/tofu
}
