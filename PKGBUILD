# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=convertlit-nop
pkgver=0.0.1
pkgrel=1
pkgdesc='Link /usr/bin/false to /usr/bin/clit'
arch=(any)
url='none'
license=('MIT')
provides=('convertlit')
source=()

package() {
    mkdir -p $pkgdir/usr/bin
    ln -sf false $pkgdir/usr/bin/clit
}
