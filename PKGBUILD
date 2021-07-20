# Maintainer: Raku <raku at raku dot party>

pkgname=pimpmystremio-bin
pkgver=1.2.2
pkgrel=3
pkgdesc='Local add-on manager for Stremio'
arch=('x86_64')
url='https://github.com/sungshon/PimpMyStremio'
license=('MIT')
optdepends=('stremio: Stremio client')
source=("https://github.com/sungshon/PimpMyStremio/releases/download/v${pkgver}/PimpMyStremio-linux.zip")
sha256sums=('cd2c93942995ab59e85af18ff3d49aef90d1ebdcc0c9205e3696071df3942c2b')
options=('!strip')

package () {
    install -D -m755 "PimpMyStremio/PimpMyStremio" "${pkgdir}/usr/bin/pimpmystremio"
}
