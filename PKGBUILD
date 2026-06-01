# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=git-ss-bin
pkgver=0.2.1
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
sha256sums_x86_64=('e752cec83edc7cb61d058ff98b5eebe6064bd09aad2e9dce25bc76b48cf0d5a9')
sha256sums_aarch64=('770545a9790af10087959fbd05ee1005692593af70e677ee4f227823454852ea')

package() {
  install -Dm755 "git-ss-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/git-ss"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
