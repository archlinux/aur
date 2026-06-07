# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=git-ss-bin
pkgver=0.3.0
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
sha256sums_x86_64=('56caa80a6788e38ba54c6bf17b6e6858e02cca69dc2fb9480dc77526591640a2')
sha256sums_aarch64=('9e757d115e9b616e46be21f59f631f1465ace60ce9a288c495bfdf5ac0cbbe50')

package() {
  install -Dm755 "git-ss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/git-ss"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
