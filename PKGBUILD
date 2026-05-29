# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=git-ss-bin
pkgver=0.1.2
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
sha256sums=('b0e4e844bd9b6e68ec723bc5641ba39a94590a254e0d15c1bdad494d9b7bd7ac'
            'd9c5c3f4f9e4429b77f047f8b1740c17302b831611421a5a343e75203bea6c27')

package() {
  install -Dm755 "git-ss-${pkgver}" "${pkgdir}/usr/bin/git-ss"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
