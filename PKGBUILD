# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=glow-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Markdown renderer for the CLI"
arch=('x86_64')
url="https://github.com/charmbracelet/glow"
license=('MIT')
provides=('glow')
conflicts=('glow')
source_x86_64=("https://github.com/charmbracelet/glow/releases/download/v${pkgver}/glow_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('a7fdd84bae57f24756fd9a08d327ccc0d0c358b08949eacc35600a0575508f1d')

package() {
    install -Dm755 $srcdir/glow ${pkgdir}/usr/bin/glow
}

# vim:set ts=4 sw=4 et:
