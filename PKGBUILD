# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=git-ss-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='A Git plugin for sharing temporary snapshot branches.'
arch=('x86_64' 'aarch64')
url='https://github.com/rijuyuezhu/git-ss'
license=('MIT')
depends=('git')
provides=('git-ss')
conflicts=('git-ss')
options=('!strip')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("git-ss-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/git-ss-x86_64-unknown-linux-musl")
source_aarch64=("git-ss-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/git-ss-aarch64-unknown-linux-musl")
sha256sums=('d9c5c3f4f9e4429b77f047f8b1740c17302b831611421a5a343e75203bea6c27')
sha256sums_x86_64=('d954e4d2f395fee478779f0dbb3e8ce90df8f2f5b102065058bfef69de853d29')
sha256sums_aarch64=('23c7c82c9aedd825768610a24fe070e09967f53f9c5717182785eac48a41b593')

package() {
  install -Dm755 "git-ss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/git-ss"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
