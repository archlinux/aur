# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

pkgname=glow-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Markdown renderer for the CLI"
arch=('x86_64')
url="https://github.com/charmbracelet/glow"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('3eeaf0d1e36d245bb00b335e769822e1c9633cdd8bb0ea88b74fe4a63abe751d')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
