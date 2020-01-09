# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

pkgname=glow-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Markdown renderer for the CLI"
arch=('x86_64')
url="https://github.com/charmbracelet/glow"
license=('MIT')
provides=('glow')
conflicts=('glow')
source_x86_64=("$url/releases/download/v$pkgver/glow_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('ea3b158c1c3f3f9ce63a701817ffc9023bbcf2c5375f21a5890ddda7d57554c5')

package() {
    install -Dm755 "glow" "$pkgdir/usr/bin/glow"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
