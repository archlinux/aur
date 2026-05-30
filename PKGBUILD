# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=git-ss-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='A Git plugin for sharing temporary snapshot branches.'
arch=('x86_64')
url='https://github.com/rijuyuezhu/git-ss'
license=('MIT')
depends=('git')
provides=('git-ss')
conflicts=('git-ss')
options=('!strip')
source=("git-ss-${pkgver}::${url}/releases/download/v${pkgver}/git-ss-x86_64-unknown-linux-musl"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('9b782ec7dd0ce873c687c59629a82f52e3fe7f9304ca3c59d6f7c11d850c3058'
            'd9c5c3f4f9e4429b77f047f8b1740c17302b831611421a5a343e75203bea6c27')

package() {
  install -Dm755 "git-ss-${pkgver}" "${pkgdir}/usr/bin/git-ss"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
