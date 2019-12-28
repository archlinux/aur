# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

pkgname=glow-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Markdown renderer for the CLI"
arch=('x86_64')
url="https://github.com/charmbracelet/glow"
license=('MIT')
provides=('glow')
conflicts=('glow')
source_x86_64=("$url/releases/download/v$pkgver/glow_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('b9e9759d33fe1b3d69afbebc7ba0d9403914f63883699c65e259c4c44469f7b8')

package() {
    install -Dm755 "glow" "$pkgdir/usr/bin/glow"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
