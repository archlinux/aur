pkgname=swiftpeek-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Ultralight file previewer written in Rust (precompiled binary)"
arch=('x86_64')
url="https://github.com/acosta-dev/SwiftPeek"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'glib2')
provides=('swiftpeek')
conflicts=('swiftpeek')

source=("https://pub-a604c65ec55d4555ba01a5dab3d0e2b4.r2.dev/swiftpeek-${pkgver}-x86_64.tar.gz")

sha256sums=('bcf0d0a6d4fca7af1ed4072bcbbad076cbdad0a2311633e5ddaad86974c676b8')

package() {
    install -Dm755 "${srcdir}/swiftpeek" "${pkgdir}/usr/bin/swiftpeek"
}
