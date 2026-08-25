# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-bin
pkgver=0.7.17
pkgrel=1
pkgdesc="OA — Vulkan 1.4 compute runtime for ML, vision, audio, crypto, and UI (pre-built binaries)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=('vulkan-icd-loader')
provides=("oa=${pkgver}")
conflicts=('oa')
options=('!strip' '!debug')
source=("https://github.com/realminc/oa/releases/download/v${pkgver}/oa-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('1b156d2f34ed510c4e75583bc420be9d80a784df4bcd47200f76fb540a84ca95')

package() {
  tar -xzf "$srcdir/oa-${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"
}
