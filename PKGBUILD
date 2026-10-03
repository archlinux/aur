# Maintainer: MCBSMARTBOY <2720838051 at qq dot com>
pkgname=n3v3-bin
pkgver=5.0.3
pkgrel=1
pkgdesc='Pure functional language for system configuration (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/MCB-SMART-BOY/n3v3'
license=('MPL-2.0')
depends=('glibc' 'gcc-libs' 'zlib')
provides=("n3v3=${pkgver}")
conflicts=('n3v3' 'n3v3-git')
options=('!debug' '!strip')
source_x86_64=("n3v3-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/n3v3-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("n3v3-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/n3v3-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c469f6e2249606bd163cd1565c7c998a1e9da3605ecc06b1052ea55c16a6af79')
sha256sums_aarch64=('15a1db4b2ea393ba55f350d83df19ad126948d0e46405c5936fd161f293fc895')

package() {
    install -Dm755 "${srcdir}/n3v3" "${pkgdir}/usr/bin/n3v3"
}
