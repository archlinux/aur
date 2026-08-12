# Maintainer: Evan Sosenko <razorx@evansosenko.com>

pkgname=mago-bin
pkgver=1.46.0
pkgrel=1
pkgdesc="An extremely fast PHP linter, formatter, and static analyzer, written in Rust."
url="https://github.com/carthage-software/mago"
arch=('x86_64')
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
source=("https://github.com/carthage-software/mago/releases/download/${pkgver}/mago-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('66d1a528d8767be3f9ef71ef9c53a24a632e20a8defcb79bd083ba73e337c7ec')

package() {
  cd "${srcdir}/mago-${pkgver}-x86_64-unknown-linux-musl"
  install -Dm0755 -t "${pkgdir}/usr/bin/" mago
  install -Dm644 -t "${pkgdir}/usr/share/licenses/mago/" LICENSE-MIT
  install -Dm644 -t "${pkgdir}/usr/share/licenses/mago/" LICENSE-APACHE
}
