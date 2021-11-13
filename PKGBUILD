# Maintainer: mztikk <mztikk@outlook.de>
pkgbase=yearsfx
pkgname=yearsfx-git
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Appends years in range to input"
url="https://github.com/mztikk/yearsfx"
license=('MIT')

package() {
    cd $srcdir
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path ../
}
