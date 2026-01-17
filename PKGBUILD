# Maintainer: Evan Sosenko <razorx@evansosenko.com>

pkgname=mago-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="An extremely fast PHP linter, formatter, and static analyzer, written in Rust."
url="https://github.com/carthage-software/mago"
arch=('x86_64')
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
source=("https://github.com/carthage-software/mago/releases/download/${pkgver}/mago-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('6f81df57eb1b94098d84a626ae13819bd09acb60bb32228362dcc74f118970f2')

package() {
  cd "${srcdir}/mago-${pkgver}-x86_64-unknown-linux-musl"
  install -Dm0755 -t "${pkgdir}/usr/bin/" mago
  install -Dm644 -t "${pkgdir}/usr/share/licenses/mago/" LICENSE-MIT
  install -Dm644 -t "${pkgdir}/usr/share/licenses/mago/" LICENSE-APACHE
}
