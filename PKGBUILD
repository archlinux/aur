# Maintainer: mztikk <mztikk@outlook.de>
pkgbase=fmnl
pkgname=fmnl-git
conflicts=('fmnl')
provides=('fmnl')
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo' 'git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Formats newlines of input with a given string"
url="https://github.com/mztikk/fmnl"
source=('fmnl::git+https://github.com/mztikk/fmnl.git#branch=master')
license=('MIT')

package() {
    cd $srcdir
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path ./fmnl
}
sha256sums=('SKIP')
